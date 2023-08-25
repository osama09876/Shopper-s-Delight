import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/Category.dart';
import 'package:shop_now/Views/Dashboard.dart';
import 'package:shop_now/Views/FavouriteScreen.dart';
import 'package:shop_now/Views/ProfileScreen.dart';
import 'package:shop_now/Views/Wallet.dart';

import '../providers/cartprovider.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  String? image;
  int _currentIndex = 2;
  final List _screen = [
    WalletScreen(),
    CategoriesScreen(),
    Dashboard(),
    FavouriteScreen(),
    Profile(),
  ];
  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue, // Set your desired background color here
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: appcolor,
          ),
          selectedLabelStyle: TextStyle(
            color: appcolor,
          ),
          selectedItemColor: appcolor,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.wallet,
                  // color: appcolor,
                ),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.house,
                ),
                label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Badge(
                  child: Icon(Icons.favorite_border_outlined),
                  label: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Text(cart.favlist.length.toString());
                    },
                  ),
                ),
                label: 'Favourite'),
            BottomNavigationBarItem(
                icon: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(image!),
                          height: 33,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Icon(
                        Icons.person,
                      ),
                label: 'Account'),
          ],
        ),
      ),
    );
  }

  void getImage() async {
    final pref = await SharedPreferences.getInstance();
    var imageUrl = pref.getString('imageUrl');
    setState(() {
      image = imageUrl;
    });
  }
}
