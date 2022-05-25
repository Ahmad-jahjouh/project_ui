import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:superstore/models/favorite.dart';

import '../models/cart.dart';
import '../models/product.dart';

class FbFireStoreController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> addToCart({required Cart cart}) async {
    return _fireStore
        .collection('Carts')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(cart.id)
        .set(cart.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addToFavorite({required Favorite favorite}) async {
    return _fireStore
        .collection('Favorites')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('favorite')
        .doc(favorite.id)
        .set(favorite.toMap())
        .then((value) => true)
    // {
    //   return
    //       _addUserToProductFavorite(productId: favorite.id);
    // })
        .catchError((error) => false);
  }

  Future<List<String>> getFdocs() async {
    List<String> list = [];
    await FirebaseFirestore.instance
        .collection("Favorites")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('favorite')
        // .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        list.add(value.docs[i].get('id'));
      }
    }).catchError((error) => false);
    return list;
  }

  Stream<QuerySnapshot> readFavorite() async* {
    List<String> list = await getFdocs();
    yield* _fireStore
        .collection('Products')
        .where(FieldPath.documentId, whereIn: list)
        .snapshots();
  }

  Future<bool> deleteFavotite({required String id}) async {
    return _fireStore
        .collection('Favorites')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('favorite')
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> create({required Product product}) async {
    return _fireStore
        .collection('Products')
        .add(product.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> _addUserToProductFavorite({required String productId}) async {
  //   return _fireStore
  //       .collection('Products')
  //       .doc(productId)
  //       .collection('Liked_users')
  //       .doc(_firebaseAuth.currentUser!.uid)
  //       .set({'id': _firebaseAuth.currentUser!.uid})
  //       // .update(product.toMap())
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  // Future<bool> getUserToProductFavorite({required String productId}) async {
  //   return await _fireStore
  //       .collection('Products')
  //       .doc(productId)
  //       .collection('Liked_users')
  //       .doc(_firebaseAuth.currentUser!.uid)
  //       .get()
  //       .then((value) => value.data()?['id'] == _firebaseAuth.currentUser!.uid)
  //       .catchError((error) => false);
  // }

  Future<List<String>> getDocs() async {
    List<String> list = [];
    await FirebaseFirestore.instance
        .collection("Carts")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        // .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        list.add(value.docs[i].get('id'));
      }
    }).catchError((error) => false);
    return list;
  }

  Stream<QuerySnapshot> readCart() async* {
    List<String> list = await getDocs();
    yield* _fireStore
        .collection('Products')
        .where(FieldPath.documentId, whereIn: list)
        .snapshots();
  }

  Stream<QuerySnapshot> read() async* {
    yield* _fireStore.collection('Products').snapshots();
  }

  Future<bool> deleteCart({required String productId}) async {
    return _fireStore
        .collection('Carts')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(productId)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> delete({required String path}) async {
    return _fireStore
        .collection('Products')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }
}
