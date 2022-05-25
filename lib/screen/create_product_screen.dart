import 'package:flutter/material.dart';
import 'package:superstore/fb_controllers/fb_fire_store_controller.dart';
import 'package:superstore/models/helpers.dart';
import 'package:superstore/models/product.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen>
    with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _genderTextController;
  late TextEditingController _priceTextController;
  late TextEditingController _descriptionTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _genderTextController = TextEditingController();
    _priceTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _genderTextController.dispose();
    _priceTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextField(
            controller: _nameTextController,
            decoration: const InputDecoration(hintText: 'Enter Name'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _genderTextController,
            decoration: const InputDecoration(hintText: 'Enter Gender'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _priceTextController,
            decoration: const InputDecoration(hintText: 'Enter Price'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _descriptionTextController,
            decoration: const InputDecoration(hintText: 'Enter description'),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              await performCreate();
            },
            child: const Text(
              'Create',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 50),
                primary: Colors.redAccent,
                elevation: 0),
          )
        ],
      ),
    );
  }

  Future<void> performCreate() async {
    if (checkData()) {
      create();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _genderTextController.text.isNotEmpty &&
        _priceTextController.text.isNotEmpty &&
        _descriptionTextController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
          context: context, message: 'Enter required data', error: true);
      return false;
    }
  }

  Future<void> create() async {
    bool status = await FbFireStoreController().create(product: product);
    String message = status ? 'Created successfully' : 'Create failed';
    showSnackBar(context: context, message: message, error: !status);
    if (status) clear();
  }

  Product get product {
    Product product = Product();
    product.name = _nameTextController.text;
    product.gender = _genderTextController.text;
    product.price = _priceTextController.text;
    product.description = _descriptionTextController.text;
    return product;
  }

  void clear() {
    _nameTextController.text = '';
    _genderTextController.text = '';
    _priceTextController.text = '';
    _descriptionTextController.text = '';
  }
}
