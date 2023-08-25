import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';

import '../providers/themeProvider.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        title: Text('Privacy Policy'),
      ),
      body: ListView(
        children: [
          Center(
              child: CustomText(
                  'Privacy Policy for Sopping Delight', 25, FontWeight.bold)),
          CustomText(
              'Thank you for choosing Sopping Delight. We value your privacy and are committed to safeguarding your personal information. This Privacy Policy explains how we collect, use, disclose, and protect the information you provide to us through our mobile application. By accessing or using our app, you consent to the practices described in this policy.',
              16,
              FontWeight.normal),
          CustomText('Information We Collect', 22, FontWeight.bold),
          CustomText(
              'We may collect the following types of information when you use our mobile application:',
              16,
              FontWeight.normal),
          CustomText('1.Personal Information:', 20, FontWeight.bold),
          CustomText(
              'We may collect personal information such as your name, email address, phone number, shipping address, and billing information when you create an account, place an order, or communicate with us.',
              16,
              FontWeight.normal),
          CustomText('2.Device Information:', 20, FontWeight.bold),
          CustomText(
              'We automatically collect information about your mobile device, including its type, operating system, unique device identifier, IP address, mobile network information, and app usage statistics.',
              16,
              FontWeight.normal),
          CustomText('3.Usage Data:', 20, FontWeight.bold),
          CustomText(
              'We gather data about how you interact with our app, including the products you view, search terms, pages you visit, and actions you take while using the app.',
              16,
              FontWeight.normal),
          CustomText('4.Location Information: ', 20, FontWeight.bold),
          CustomText(
              'With your consent, we may collect your precise location data to offer location-based features, such as displaying nearby stores or personalized content.',
              16,
              FontWeight.normal),
          CustomText('How We Use Your Information', 22, FontWeight.bold),
          CustomText(
              'We use the collected information for various purposes, including:',
              16,
              FontWeight.normal),
          CustomText('5. Security', 20, FontWeight.bold),
          CustomText(
              'We implement security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is completely secure.',
              16,
              FontWeight.normal),
          CustomText("6. Children's Privacy", 20, FontWeight.bold),
          CustomText(
              'Our app is not intended for use by individuals under the age of [minimum age]. We do not knowingly collect personal information from children. If you believe we have collected information from a child, please contact us.',
              16,
              FontWeight.normal),
          CustomText('7. Changes to this Privacy Policy', 20, FontWeight.bold),
          CustomText(
              'We may update this Privacy Policy periodically. The "Last Updated" date at the top of the policy indicates the latest revision date. We recommend reviewing this policy regularly.',
              16,
              FontWeight.normal),
        ],
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
