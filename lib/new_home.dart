import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
       color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   FirebaseAuth.instance.currentUser!.displayName!,
          //   style: const TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       // color: Colors.black87
          //       color: Colors.white),
          // ),
          // const SizedBox(height: 10),
          Text(
            FirebaseAuth.instance.currentUser!.email!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                 color: Colors.black87
            ),
          ),
          const SizedBox(height: 30),
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.green,
            shape:
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
            //firebase SignOut
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text(
              'LOG OUT',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    ));
  }
}
