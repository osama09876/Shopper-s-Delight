import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/thankyou.dart';
import 'package:shop_now/providers/cartprovider.dart';

import '../providers/themeProvider.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  int? totalAmount;
  Checkout({super.key, required this.totalAmount});

  @override
  State<Checkout> createState() => _CheckoutState(totalAmount: totalAmount);
}

class _CheckoutState extends State<Checkout> {
  int? totalAmount;
  _CheckoutState({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    DateTime selectedDate = DateTime.now();
    var formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate);
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CHECK OUT',
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Master Card',
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image(
                image: AssetImage('assets/images/credit-card.png'),
                height: 180,
                width: double.infinity,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Choose Payment',
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appcolor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.apple,
                        size: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appcolor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image(image: AssetImage('assets/images/master.png')),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appcolor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'VISA',
                        style: GoogleFonts.actor(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appcolor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.paypal,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Promo Or Voucher',
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: appcolor.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Add Your Code',
                        style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'XYZ',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Avaible Balance',
                    style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$ ${cart.balance}',
                    style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$${widget.totalAmount}',
                    style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (widget.totalAmount! > cart.balance) {
                    var snackBar =
                        SnackBar(content: Text('Insufficient balance'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (widget.totalAmount! <= 0) {
                    var snackBar = SnackBar(content: Text('Cart is empty'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThankYouScreen(),
                        ));
                    cart.balanceDetection(widget.totalAmount!.toInt());
                    cart.emptyList();
                    setState(() {
                      // selectedDate = DateTime.now();
                      formattedDate;
                    });
                    cart.paymentdetails(selectedDate, totalAmount!.toInt());
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  height: 60,
                  decoration: BoxDecoration(
                    color: appcolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Make Payment',
                      style: GoogleFonts.adventPro(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
