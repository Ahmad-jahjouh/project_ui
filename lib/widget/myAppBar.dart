import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;


  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      actions: [IconButton(onPressed: () {
        Navigator.pushNamed(context, '/FavoriteScreen');
      }, icon: const Icon(Icons.favorite_outline))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
