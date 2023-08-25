import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/Furniture.dart';
import 'package:shop_now/Views/MensProducts.dart';
import 'package:shop_now/Views/MobileProduct.dart';
import 'package:shop_now/Views/femalproduct.dart';

import '../providers/themeProvider.dart';
// import 'ApiProduct.dart';
import 'homeAppliances.dart';
// import 'package:shop_now/UI%20Helper/Customcolor.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isLoading = true;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imagesassets = [
      'assets/images/men.jpg',
      'assets/images/women.jpg',
      'assets/images/chair.jpg',
      'assets/images/samsung1.jpg',
      'assets/images/juicer.jpg',
    ];

    final List<Widget> screens = [
      MensPoduct(),
      WomensPoduct(),
      Furniture(),
      PhoneCollections(),
      HomeAppliances(),
    ];
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        title: Text('All Products'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: imagesassets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screens[index],
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagesassets[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
