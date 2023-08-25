import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
      required String? okBtnText,
      required String? cancelBtnText,
      required VoidCallback okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                child: Text(
                  cancelBtnText.toString(),
                  style: GoogleFonts.aboreto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text(
                  okBtnText.toString(),
                  style: GoogleFonts.aboreto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: okBtnFunction,
              ),
            ],
          );
        });
  }
}
