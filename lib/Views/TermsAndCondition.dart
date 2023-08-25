import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';

import '../providers/themeProvider.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Terms & Condition',
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomText('Welcome to our E-commerce app', 25, FontWeight.bold),
            CustomText(
                'These Terms and Conditions govern your use of this mobile application. By accessing or using this app, you acknowledge that you have read, understood, and agreed to be bound by these Terms and Conditions. If you do not agree with any of these terms, you are prohibited from using or accessing this app.',
                18,
                FontWeight.normal),
            CustomText('1. Account Registration', 20, FontWeight.bold),
            CustomText(
                'To make full use of our E-commerce app and services, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and ensuring that it remains secure. You agree to be held responsible for all activities that occur under your account.',
                18,
                FontWeight.normal),
            CustomText('2.Products and Services', 20, FontWeight.bold),
            CustomText(
                'Our E-commerce app offers a variety of products and services for purchase. We strive to provide accurate and up-to-date product information, but we do not guarantee the accuracy, completeness, or reliability of any information on the app. Prices, product descriptions, and availability are subject to change without notice.',
                18,
                FontWeight.normal),
            CustomText('3. Ordering and Payments', 20, FontWeight.bold),
            CustomText(
                'When you place an order for products or services, you agree to pay the stated price for the items, along with any applicable taxes and shipping fees. Payment must be made at the time of purchase. We accept various payment methods, and all transactions are secured using industry-standard encryption.',
                18,
                FontWeight.normal),
            CustomText('4. Shipping and Delivery', 20, FontWeight.bold),
            CustomText(
                'We will make every effort to ensure timely delivery of your orders. However, we do not guarantee delivery dates and are not liable for any delays caused by unforeseen circumstances, such as natural disasters, customs delays, or carrier issues.',
                18,
                FontWeight.normal),
            CustomText('5. Returns and Refunds', 20, FontWeight.bold),
            CustomText(
                'If you are not satisfied with your purchase, you may be eligible for a return or refund, subject to our return policy. Please review our return policy for detailed information on the process and eligibility criteria.',
                18,
                FontWeight.normal),
            CustomText('6. User Conduct', 20, FontWeight.bold),
            CustomText(
                "You agree to use this E-commerce app only for lawful purposes and in a manner that does not infringe upon the rights of others or inhibit the app's functionality. You must not engage in any activity that could damage, disable, or impair the app or its servers.",
                18,
                FontWeight.normal),
            CustomText('7. Intellectual Property', 20, FontWeight.bold),
            CustomText(
                "All content and materials available on this E-commerce app, including but not limited to logos, trademarks, text, graphics, images, and software, are the property of the app's owners or licensed to us. You may not use, reproduce, or distribute any content from this app without obtaining prior written permission.",
                18,
                FontWeight.normal),
            CustomText('8. Privacy Policy', 20, FontWeight.bold),
            CustomText(
                'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and safeguard your personal information.',
                18,
                FontWeight.normal),
            CustomText(
                '9. Modifications to the App and Terms', 20, FontWeight.bold),
            CustomText(
                'We reserve the right to modify or discontinue any aspect of this E-commerce app, including these Terms and Conditions, at any time without notice. It is your responsibility to review these terms periodically for any changes.',
                18,
                FontWeight.normal),
            CustomText('10. Disclaimer of Warranties', 20, FontWeight.bold),
            CustomText(
                'This E-commerce app is provided on an "as-is" basis, without warranties of any kind, express or implied. We do not warrant that the app will be error-free, uninterrupted, or secure.',
                18,
                FontWeight.normal),
            CustomText('11. Limitation of Liability', 20, FontWeight.bold),
            CustomText(
                'In no event shall we be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of this E-commerce app.',
                18,
                FontWeight.normal),
            CustomText('12. Governing Law', 20, FontWeight.bold),
            CustomText(
                'These Terms and Conditions shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law provisions.',
                18,
                FontWeight.normal),
            CustomText('Last updated: [20.Aug.2023]', 20, FontWeight.bold),
          ],
        ),
      ),
    );
  }

  Widget CustomText(String text, double fontsize, FontWeight isBold) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 350,
      child: Text(
        text,
        style: GoogleFonts.aboreto(
          fontSize: fontsize,
          fontWeight: isBold,
        ),
      ),
    );
  }
}
