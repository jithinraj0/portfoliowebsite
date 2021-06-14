import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/screens/landing/footer/footer_page.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

showSuccessDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future submitQuote(
    {String name,
    String email,
    String quotecontent,
    CollectionReference quote}) {
  //CollectionReference quote = FirebaseFirestore.instance.collection('quotes');

  return quote.add({
    'name': name, // John Doe
    'email': email, // Stokes and Sons
    'quote': quotecontent // 42
  }).whenComplete(() {
    Get.back();
    Get.snackbar(
      "Done",
      "Quote sent successfully",
      borderRadius: 0,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 350,
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      backgroundColor: Colors.green[800],
      colorText: Colors.white,
    );
  }).catchError((error) {
    Get.back();
    Get.snackbar(
      "Failed ",
      "Quote sent failed by $error",
      borderRadius: 0,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 350,
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      backgroundColor: Colors.red[900],
      colorText: Colors.white,
    );
   
  });
}

/* 

class AddUser extends StatelessWidget { 
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
     
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}*/
