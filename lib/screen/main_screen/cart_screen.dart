import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        Container(
          height: 410,
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade100,
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                '\$ 15',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 16),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 5),
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
}
