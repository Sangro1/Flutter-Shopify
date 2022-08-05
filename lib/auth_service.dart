
import 'package:example1/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'new_home.dart';

class AuthService{
  //1. handle AuthState()

  //2. signInWithGoogle()

  //3. signOut()


  //determine if user is authenticated

  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return NewHomePage();
          }else{
            return const LoginPage();
          }
        });
  }
signInWithGoogle() async{
    //trigger auth flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn(
    scopes:<String>["email"]).signIn();

  //Obtain the auth details from request
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

  //create new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );


  //Once sign in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

 //signOut
  signOut(){
    FirebaseAuth.instance.signOut();
}
}

