import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationStatus = true;
  bool _PopupStatus = true;
  bool _orderHistoryStatus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your App Settings',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          SwitchListTile(
              activeColor: Colors.redAccent,
              title: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              subtitle: const Text(
                  'Receive notifications on latest offers and  store updates'),
              value: _notificationStatus,
              onChanged: (bool value) {
                setState(() {
                  _notificationStatus = value;
                });
              }),
          const SizedBox(height: 40),
          SwitchListTile(
              activeColor: Colors.redAccent,
              title: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Popups',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              subtitle: const Text(
                  'Receive notifications on latest offers and  store updates'),
              value: _PopupStatus,
              onChanged: (bool value) {
                setState(() {
                  _PopupStatus = value;
                });
              }),
          const SizedBox(height: 40),
          SwitchListTile(
              activeColor: Colors.redAccent,
              title: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Order History',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              subtitle: const Text(
                  'Receive notifications on latest offers and  store updates'),
              value: _orderHistoryStatus,
              onChanged: (bool value) {
                setState(() {
                  _orderHistoryStatus = value;
                });
              }),
          const SizedBox(height:60),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                'UPDATE SETTINGS',
                style: TextStyle(color: Colors.white),
              ),
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
          ),)
        ],
      ),
    );
  }
}
