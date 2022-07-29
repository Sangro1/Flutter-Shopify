import 'package:example1/uti/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final  _formKey = GlobalKey<FormState>();
 // final TextEditingController _emailController  => TextEditingController();
 //  final TextEditingController _passwordController  => TextEditingController();




  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/images/new.png",
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  // controller : _emailController,

            decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    //call setSate because we reload this StatefulWidget again
                    setState(() {});
                  },
                ),
                TextFormField(

                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password ",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 6) {
                      return "Password length should be atlest 6";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                //Animation Widget for login button

                Material(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                    //fat operator
                    onTap: () => moveToHome(context),

                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.red[500],
                        //button logic
                        shape:
                            changeButton ? BoxShape.circle : BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
