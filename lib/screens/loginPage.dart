import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plants/screens/homePage1.dart';
import 'package:plants/screens/signUpPage.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  String username = 'admin';
  String password = 'abc123';
  var usercontroller = TextEditingController();
  var pwdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1491147334573-44cbb4602074?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                )),
              ),
              const Text(
                'Welcome back',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Login to your account',
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: TextFormField(
                  controller: usercontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Full name'),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: TextFormField(
                  controller: pwdcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Password'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Icon(Icons.check_box_rounded),
                  ),
                  const Text('remember me'),
                  SizedBox(width: MediaQuery.of(context).size.width * .32),
                  const Padding(
                    padding: EdgeInsets.only(right: 28),
                    child: Text('Forgot password'),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .18),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * .85,
                onPressed: () {
                  if (username == usercontroller.text &&
                      password == pwdcontroller.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage1()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login failed')));
                  }
                },
                color: const Color.fromARGB(255, 18, 189, 169),
                shape: const StadiumBorder(),
                height: 46,
                child: const Text('Login'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Dont have an account',
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const signUpPage()));
                            },
                          text: 'Sign up',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
