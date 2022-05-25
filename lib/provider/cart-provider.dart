import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:superstore/fb_controllers/fb_fire_store_controller.dart';
import 'package:superstore/models/product.dart';

class CartProvider extends ChangeNotifier {

  bool isLike = false;

  bool changeFavorite(bool isLike){
   this.isLike = isLike;
    notifyListeners();
    return true;
  }




}
