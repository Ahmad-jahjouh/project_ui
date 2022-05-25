import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superstore/provider/cart-provider.dart';
import 'package:superstore/screen/create_product_screen.dart';
import 'package:superstore/screen/favorite_screen.dart';
import 'package:superstore/screen/main_screen/cart_screen.dart';
import 'package:superstore/screen/main_screen/home_screen.dart';
import 'package:superstore/screen/launch_screen.dart';
import 'package:superstore/screen/login_screen.dart';
import 'package:superstore/screen/main_screen/main_screen.dart';
import 'package:superstore/screen/main_screen/profile_screen.dart';
import 'package:superstore/screen/main_screen/setting_screeen.dart';
import 'package:superstore/screen/product_screen.dart';
import 'package:superstore/screen/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/LaunchScreen',
        routes: {
          '/LaunchScreen': (context) => const LaunchScreen(),
          '/LoginScreen': (context) => const LoginScreen(),
          '/RegisterScreen': (context) => const RegisterScreen(),
          '/MainScreen': (context) => const MainScreen(),
          '/HomeScreen': (context) => const HomeScreen(),
          '/CartScreen': (context) => const CartScreen(),
          '/ProfileScreen': (context) => const ProfileScreen(),
          '/SettingScreen': (context) => const SettingScreen(),
          '/FavoriteScreen': (context) => const FavoriteScreen(),
          '/ProductScreen': (context) => const ProductScreen(),
          '/CreateProductScreen': (context) => const CreateProductScreen(),
        },
      ),
    );
  }
}
