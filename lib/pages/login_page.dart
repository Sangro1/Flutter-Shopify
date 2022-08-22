import 'package:example1/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../uti/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', pass = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      child: Column(
        children: [
          Container(
            child: Material(
              child: Column(
                children: [
                  // Image.asset(
                  //   "assets/images/new.png",
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Welcome to Sign In page ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            //bang operator is used here
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            pass = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password ",
                            labelText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          alignment: Alignment(1, 0),
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          child:  Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: Colors.black,
                            elevation: 7,
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                    email: email,
                                    password: pass,
                                      );
                                  Navigator.pushNamed(
                                      context, MyRoutes.homeRoute);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                } catch(e){
                                  print(e);
                                }
                              },
                              child: Center(
                                  child: Text('SIGNIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                  ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //Google login Button activity
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Material(
                            child: GestureDetector(
                              onTap: () {
                                AuthService().signInWithGoogle();
                                Navigator.pushNamed(
                                    context, MyRoutes.homeRoute);
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/images/googlebutton.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10, left: 0),
                          child: InkWell(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.registerRoute);
                            },
                          ),
                        ),
                      ],
                    ),
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
