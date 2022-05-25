import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superstore/fb_controllers/fb_fire_store_controller.dart';
import 'package:superstore/models/favorite.dart';
import 'package:superstore/models/helpers.dart';
import 'package:superstore/models/product.dart';
import 'package:superstore/provider/cart-provider.dart';

import '../../fb_controllers/fb_auth_controllers.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Helpers {

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FbFireStoreController().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<QueryDocumentSnapshot> product = snapshot.data!.docs;
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 168 / 314,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                        Navigator.pushNamed(context, '/ProductScreen',
                        arguments: {
                          'id': product[index].id,
                          'email': FirebaseAuth.instance.currentUser!.email,
                          'name': product[index].get('name'),
                          'gender': product[index].get('gender'),
                          'price': product[index].get('price'),
                          'description': product[index].get('description'),
                        });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          child: Image.asset(
                            'images/background_launcg_screen.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(product[index].get('name'))),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(context: context, builder:(BuildContext context){
                                          return AlertDialog(
                                            title: const Text('Delete Now!',style: TextStyle(color: Colors.black)),
                                            content: const Text('This product will be deleted'),
                                            actions: [
                                              TextButton(onPressed: (){
                                                deleteProduct(path: product[index].id);
                                                Navigator.pop(context);
                                              }, child: const Text('delete',style: TextStyle(color: Colors.red))),
                                            ],
                                          );
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.redAccent,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                        product[index].get('gender'),
                                        style: const TextStyle(
                                            color: Colors.grey),
                                      )),
                                  // FutureBuilder<bool>(
                                  //   future: FbFireStoreController().getUserToProductFavorite(productId: product[index].id),
                                  //   builder: (context,snapshot) {
                                  //     bool isLike = snapshot.data ?? false;
                                       IconButton(
                                          onPressed: () async {
                                             // isLike = await FbFireStoreController().deleteFavotite(id: product[index].id)
                                            status = Provider.of<CartProvider>(context,listen: false).changeFavorite(true);
                                               status =  await FbFireStoreController().addToFavorite(favorite: getFavorite(id: product[index].id));
                                              // status = await FbFireStoreController().deleteFavotite(id: product[index].id);
                                            String message = Provider.of<CartProvider>(context).isLike ? 'Add To Favorite Successfully' : 'Add Field';
                                            showSnackBar(context: context, message: message);
                                          },
                                          icon:  Icon(
                                            Icons.favorite_border ,
                                            // Icons.favorite_border,
                                            color: Provider.of<CartProvider>(context).isLike ? Colors.red : Colors.black,
                                          )),
                                  //   }
                                  // ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$ ${product[index].get('price')} ',
                                    style: const TextStyle(
                                        color: Colors.redAccent, fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: product.length,
            );
          }
        });
  }

  Favorite getFavorite({required String id}){
    Favorite favorite = Favorite();
    favorite.id = id;
    return favorite;
  }

  Future<void> deleteProduct({required String path}) async {
    bool status = await FbFireStoreController().delete(path: path);
    String message = status ? 'deleted successfully' : 'delete filed';
    showSnackBar(context: context, message: message);
  }

  // Future<void> deleteProduct({required String path}) async {
  //   bool status = await FbFireStoreController().deleteFavotite(id: id);
  //   String message = status ? 'deleted successfully' : 'delete filed';
  //   showSnackBar(context: context, message: message);
  // }

}
