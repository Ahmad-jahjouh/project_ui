import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superstore/fb_controllers/fb_auth_controllers.dart';
import 'package:superstore/widget/logo.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  late StreamSubscription stream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      stream = FbAuthController().checkUserStatus(({required bool loggedIn}) {
        String route = loggedIn ? '/MainScreen' : '/LoginScreen';
        Navigator.pushReplacementNamed(context, route);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 5,sigmaX: 5),
            child:Image.asset("images/background_launcg_screen.jpg",fit: BoxFit.cover,height: double.infinity,) ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 150),
                Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 170),
                Logo(),
                SizedBox(height: 150),
                Text(
                  '''SUPERSTORE\n       UI KIT''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
