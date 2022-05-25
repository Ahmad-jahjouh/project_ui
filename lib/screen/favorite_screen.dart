import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superstore/models/helpers.dart';
import 'package:superstore/models/product.dart';
import 'package:superstore/provider/cart-provider.dart';

import '../fb_controllers/fb_fire_store_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with Helpers {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('My Favorite'),
        centerTitle: true,
        elevation: 0
        ,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FbFireStoreController().readFavorite(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if(snapshot.hasData){
                List<QueryDocumentSnapshot> favorite = snapshot.data!.docs;
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 168 / 314,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
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
                                        child: Text(favorite[index].get('name'))),
                                    // IconButton(
                                    //     onPressed: () {
                                    //       // deleteProduct(path: product[index].id);
                                    //     },
                                    //     icon: const Icon(
                                    //       Icons.delete_outline,
                                    //       color: Colors.redAccent,
                                    //     ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          favorite[index].get('gender'),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {

                                          });
                                            Provider.of<CartProvider>(context,listen: false).changeFavorite(false);
                                            delete(id: favorite[index].id);
                                        },
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$ ${favorite[index].get('price')} ',
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
                    );
                  },
                  itemCount: favorite.length,
                );
              }else{
                return const Center(child: Text('No Any Favorite'),);
              }
            }
          }),
    );
  }




  Future<void> delete({required String id}) async{
    bool status = await FbFireStoreController().deleteFavotite(id: id);
    String message = status ? 'deleted successfully' : 'delete filed';
    showSnackBar(context: context, message: message);
  }
  

}
