import 'package:example1/uti/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "" ;
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset("assets/images/login_img.png",
            fit: BoxFit.cover,
          ),SizedBox(
            height: 20,),
          Text(
            "Welcome $name",
            style: TextStyle(
              fontSize: 28,
             fontWeight:FontWeight.bold,
            ),
          ),SizedBox(
            height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                  onChanged:(value){
                        name = value;
                        //call setSate because we reload this StatefulWidget again
                    setState((){});
                },
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password ",labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                //Animation Widget for login button
                InkWell(
                  onTap: () async {
                    setState((){
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context,MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton? 50: 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changeButton? Icon(Icons.done,
                    color: Colors.white,
                    ): Text('Login',
                      style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                        //button logic
                       // shape: changeButton? BoxShape.circle: BoxShape.rectangle,
                        borderRadius:
                        BorderRadius.circular(changeButton? 50: 8)
                    ),
                  ),
                ),



                // ElevatedButton(
                //   child:Text('Login'),
                //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                //   onPressed: (){
                //   // old type --Navigator.pushNamed(context, '/');
                //     //new
                //     Navigator.pushNamed(context,MyRoutes.homeRoute);
                //   },
                // ),

              ],
            ),
          ),
        ],
      ));
  }
}
