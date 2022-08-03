import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../provider/google_signIn_provider.dart';

class GoogleSignup extends StatelessWidget {
  const GoogleSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>
      Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton(
          child: Text(
            'Sign in with Google',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),
          ),



        icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red,),

          onPressed : (){
             final provider = Provider.of<GoogleSignInProvider>(context,listen:false),
            Provider.login();
         },
      ),

    );
  }

