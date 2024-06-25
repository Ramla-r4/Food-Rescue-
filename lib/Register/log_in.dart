import 'package:app/Register/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void user_Sign_up() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      WrongDailog(e.code);
    }
  }

  void WrongDailog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color((0xFFF5FFFA)),
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sign_Up()),
                      );
                    },
                    child: Image(image: AssetImage('assests/images/next.png'))),
              ),
            ),
            backgroundColor: Color((0xFFF5FFFA)),
            body: Container(
              margin: EdgeInsets.only(top: 145),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 29),
                      child: Column(
                        children: [
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                                fontSize: 43,
                                fontFamily: 'Text',
                                color: Color.fromRGBO(91, 100, 96, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 22, right: 22),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          TextFormField(
                            controller: passwordController,
                            style: TextStyle(fontSize: 10.0),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon: Icon(Icons.lock), // Add left icon

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          SizedBox(height: 64.0),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(104, 162, 138, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      14), // Rectangular shape
                                ),
                                minimumSize: Size(
                                    25, 52), // Set the desired width and height
                              ),
                              onPressed: () {
                                user_Sign_up();
                              },
                              child: Text(
                                'Log In ',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: 'Text',
                                    color: Color.fromRGBO(233, 243, 238, 1)),
                              )),
                          SizedBox(height: 244.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
