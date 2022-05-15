import 'package:flutter/material.dart';

import '../../widget/myAppBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 168 / 314,
      ),
      itemBuilder: (context, index) {
        return  GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ProductScreen');
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
                          const Expanded(child: Text('White top')),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_bag,
                                color: Colors.redAccent,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('Women',style: TextStyle(color: Colors.grey),)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('\$ 20',style: TextStyle(color: Colors.redAccent,fontSize: 16),),
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
      itemCount: 5,
    );
  }
}

