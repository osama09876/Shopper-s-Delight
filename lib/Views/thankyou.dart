// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';

class ThankYouScreen extends StatefulWidget {
  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/thankyou.json',
          repeat: false,
        ),
      ),
    );
  }
}
