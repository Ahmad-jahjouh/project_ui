import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Labtop',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/FavoriteScreen');
              },
              icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade800,
            height: 230,
            width: double.infinity,
            child: Image.asset(
              'images/background_launcg_screen.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Gucci Sunglasses',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Text(
                        '\$ 45',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on board and move the sail towards the destination.',
                    style: TextStyle(fontSize: 14,color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ADD TO CART'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.redAccent,
                      minimumSize: const Size(60, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You May Also Like',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                color: Colors.grey.shade100,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      children: const [
                        Text(
                          'white Dress',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Women',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.favorite_border,
                        //       color: Colors.black,
                        //     )),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Expanded(
                            child: Text(
                              '\$ 15',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },itemCount: 3),
          ),
        ],
      ),
    );
  }
}
