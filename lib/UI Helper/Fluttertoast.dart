import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';

class FlutterToastMessage {
  Future<void> toastMessage(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: appcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
