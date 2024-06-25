import 'package:app/Register/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_Up();
}

class _Sign_Up extends State<Sign_Up> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  void user_Sign_up() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == passwordController2.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        WrongDailog("Password don't match");
      }
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
            backgroundColor: Color((0xFFF5FFFA)),
            body: Container(
              margin: EdgeInsets.only(top: 95),
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
                            'Welcome To',
                            style: TextStyle(
                                fontSize: 53,
                                fontFamily: 'Text',
                                color: Color.fromRGBO(91, 100, 96, 1)),
                          ),
                          Text(
                            'Food Rescue',
                            style: TextStyle(
                                fontFamily: 'fonts1',
                                fontSize: 39,
                                color: Color.fromRGBO(114, 156, 139, 1)),
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
                          SizedBox(height: 25.0),
                          TextFormField(
                            controller: passwordController2,
                            style: TextStyle(fontSize: 10.0),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confrim Password',
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon:
                                  Icon(Icons.lock_outline), // Add left icon

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
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Text',
                                    color: Color.fromRGBO(233, 243, 238, 1)),
                              )),
                          SizedBox(height: 154.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text(
                              'Already Have An Account. ',
                              style: TextStyle(
                                  fontFamily: 'Text',
                                  color: Color.fromRGBO(107, 120, 115, 1),
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 44.0),
                    RichText(
                        text: TextSpan(
                            text:
                                'By Sign In You Are Agree The Tearms | Policy ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 182, 173, 173),
                                fontSize: 15)))
                  ],
                ),
              ),
            )));
  }
}
