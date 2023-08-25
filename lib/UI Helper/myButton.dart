import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Customcolor.dart';

class MyButton extends StatelessWidget {
  final String txt;
  final Function myFunc;

  MyButton({super.key, required this.txt, required this.myFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myFunc(),
      child: Container(
        height: 60,
        margin: EdgeInsets.all(40),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appcolor,
        ),
        child: Center(
          child: Text('${txt}',
              style: GoogleFonts.adventPro(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
        ),
      ),
    );
  }
}
