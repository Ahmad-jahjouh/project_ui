import 'package:flutter/material.dart';
import 'package:superstore/widget/myAppBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Container(
            height: 180,
            child: Row(
              children: [
                Image.asset(
                  'images/background_launcg_screen.jpg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ahmad Jahjouh',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      'alenjecv@gmail.com',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.edit_outlined, color: Colors.redAccent),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined,
                        color: Colors.redAccent),
                    title: Text('Shipping Address'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.favorite_outline, color: Colors.redAccent),
                    title: Text('Wishlist'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.timer_outlined, color: Colors.redAccent),
                    title: Text('Order History'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.border_all_outlined,
                        color: Colors.redAccent),
                    title: Text('Track Order'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.card_travel_outlined,
                        color: Colors.redAccent),
                    title: Text('Cards'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_outlined,
                        color: Colors.redAccent),
                    title: Text('Notifications'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.black),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.logout_outlined, color: Colors.redAccent),
                    title: Text('Log Out'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
