import 'package:email_validator/email_validator.dart';
import 'package:example1/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../uti/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  String email = '', pass = '';
  String isValid = '';
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Material(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Image.asset(
              "assets/images/new.png",
              fit: BoxFit.cover,
            ),
            Container(
              //keyboard dismissed
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Column(
                        children: [
                          //EmailField
                          TextFormField(
                            onChanged: (value) {
                              // setState(() {
                              //   isValid =
                              //       EmailValidator.validate(value) as String;
                              // });
                              email = value;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              labelText: "Username",
                            ),

                            // validator: (value) {
                            //   //bang operator is used here
                            //   if (value!.isEmpty) {
                            //     return "Username cannot be empty";
                            //   } else if (value.length < 6) {
                            //     return "Password length should be minimum 6";
                            //   }
                            //   return null;
                            // },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //PasswordField
                          TextFormField(
                            onChanged: (value) {
                              pass = value;
                            },
                            textInputAction: TextInputAction.next,
                            obscureText: _isObsecure,
                            decoration: InputDecoration(
                              hintText: "Enter password ",
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObsecure = !_isObsecure;
                                  });
                                },
                              ),
                            ),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "field can not be empty";
                            //   } else if (value.length < 6) {
                            //     return "Password length should be atl six";
                            //   }
                            // },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Forgot password
                          Container(
                            alignment: Alignment(1, 0),
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: const InkWell(
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

                          //SIGNIN Activity
                          Container(
                            height: 40,
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              shadowColor: Colors.greenAccent,
                              color: Colors.black,
                              elevation: 7,
                              child: GestureDetector(
                                onTap: () async {
                                  CircularProgressIndicator().centered().py16();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: "SignIn".text.make(),
                                      ),
                                  );
                                  try {
                                    UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: email,
                                      password: pass,
                                  );
                                    Navigator.pushNamed( context, MyRoutes.homeRoute);
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
                                  child: Text(
                                    'SIGNIN',
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
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('OR'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //Google login Button activity
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Material(
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: "Sigin with Google "
                                              .text
                                              .make()));
                                  //calling sign
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
                          SizedBox(height: 10),
                          //Register Button
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 10, left: 0),
                            child: InkWell(
                              child: Text(
                                'Sign up now',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: "Now moving Register page "
                                            .text
                                            .make()));
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
            CircularProgressIndicator().centered().py16(),

          ],
        ),
      ),
    );
  }
}
