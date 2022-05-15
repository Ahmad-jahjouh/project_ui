import 'package:flutter/material.dart';
import 'package:superstore/widget/logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 110),
            const Logo(),
            const SizedBox(height: 90),
            TextField(
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailError,
                labelStyle:
                const TextStyle(color: Colors.redAccent, fontSize: 15),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.redAccent,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordTextController,
              obscureText: true,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
                labelStyle:
                const TextStyle(color: Colors.redAccent, fontSize: 15),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.redAccent,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                preFormRegister();
              },
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                primary: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void preFormRegister() {
    if (checkData()) {
      register();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      checkFiledError();
      return true;
    } else {
      checkFiledError();
      return false;
    }
  }

  void checkFiledError() {
    setState(() {
      _emailTextController.text.isEmpty
          ? _emailError = 'Enter Email'
          : _emailError = null;
      _passwordTextController.text.isEmpty
          ? _passwordError = 'Enter Password'
          : _passwordError = null;
    });
  }

  void register() {}
}
