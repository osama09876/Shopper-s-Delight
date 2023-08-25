// import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';

class ForgetPass extends StatefulWidget {
  ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  bool loader = false;
  final auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/email.png'),
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please enter your email for forgot password',
              style: GoogleFonts.abel(),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: appcolor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  loader = true;
                });
                auth
                    .sendPasswordResetEmail(
                        email: emailcontroller.text.toString())
                    .then((value) => {
                          setState(() {
                            loader = false;
                          }),
                          FlutterToastMessage().toastMessage(
                              'We have send you email for recover password, check your email.'),
                        })
                    .onError((error, stackTrace) => {
                          setState(() {
                            loader = false;
                          }),
                          FlutterToastMessage().toastMessage(error.toString()),
                        });
                // Navigator.pushNamed(context, '/newpass');
              },
              child: Container(
                  height: 60,
                  margin: EdgeInsets.all(40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appcolor,
                  ),
                  child: Center(
                    child: loader
                        ? CircularProgressIndicator(
                            strokeWidth: 3,
                            color: whitecolor,
                          )
                        : Text('Verify',
                            style: GoogleFonts.adventPro(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
