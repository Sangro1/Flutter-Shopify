import 'dart:ffi';

import 'package:example1/auth_service.dart';
import 'package:example1/uti/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avoid_keyboard/avoid_keyboard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '', pass = '';

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Material(
      child:Column(
        children: [
          Container(
            child: Material(
              child: Column(
                children: [
                  // Image.asset("assets/images/hello.png"),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Register First",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged:(value){
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Username",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value){
                            pass = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password ",
                            labelText: "Password",
                          ),
                        ),

                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: Colors.black,
                            elevation: 7,
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: email,
                                      password: pass,
                                  );
                                  Navigator.pushNamed(context, MyRoutes.homeRoute );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print('The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }

                              },
                              child: Center(
                                  child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'
                                      )
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height :15),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: InkWell(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline
                              ),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context,MyRoutes.loginRoute);
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
