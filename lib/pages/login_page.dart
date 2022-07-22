import 'package:example1/uti/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset("assets/images/login_img.png",
            fit: BoxFit.cover,
          ),SizedBox(height: 20,),
          Text("Welcome",
            style: TextStyle(
              fontSize: 22,
             fontWeight:FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter user name",labelText: "Email",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password ",labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  child:Text('Login'),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  onPressed: (){
                  // old type --Navigator.pushNamed(context, '/');
                    //new
                    Navigator.pushNamed(context,  MyRoutes.homeRoute);
                  },

                ),

              ],
            ),
          ),
        ],
      ));
  }
}
