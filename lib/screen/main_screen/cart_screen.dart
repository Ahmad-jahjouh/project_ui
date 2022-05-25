import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superstore/fb_controllers/fb_fire_store_controller.dart';
import 'package:superstore/models/cart.dart';
import 'package:superstore/models/helpers.dart';
import 'package:superstore/provider/cart-provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade800,
          height: 230,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Your Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Order No. #123-456',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 410,
          child: StreamBuilder<QuerySnapshot>(
              stream: FbFireStoreController().readCart(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> cart = snapshot.data!.docs;
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey.shade100,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            height: 100,
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/background_launcg_screen.jpg',
                                  height: double.infinity,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart[index].get('name'),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      cart[index].get('gender'),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$ ${cart[index].get('price')}',
                                      style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Delete Now!',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                  content: const Text(
                                                      'This product will be deleted'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            delete(
                                                                productId:
                                                                    cart[index]
                                                                        .id);
                                                          });
                                                          // Provider.of<CartProvider>(context).changeDelete(delete: delete(productId: cart[index].id)).toString();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'delete',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red))),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: cart.length);
                  } else {
                    return const Center(
                      child: Text('No Any Cart'),
                    );
                  }
                }
              }),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'PROCEED TO CHECKOUT',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.redAccent,
            width: double.infinity,
            height: 50,
          ),
        ),
      ],
    );
  }

  // Future<void> delete({required String productId}) async{
  //   bool status = await Provider.of<CartProvider>(context,listen: false).deleteCart(productId: productId);
  //
  //   // bool status = await FbFireStoreController().deleteCart(productId: productId);
  //   String message = status ? 'deleted successfully' : 'delete filed';
  //   showSnackBar(context: context, message: message);
  // }

  Future<void> delete({required String productId}) async {
    bool status =
        await FbFireStoreController().deleteCart(productId: productId);
    String message = status ? 'deleted successfully' : 'delete filed';
    showSnackBar(context: context, message: message);
  }
}
