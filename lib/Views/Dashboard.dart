// import 'dart:async';
// import 'dart:convert';
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/Models/Productlist.dart';
// import 'package:shop_now/Models/ApiModel.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/AddToCard.dart';
import 'package:shop_now/Views/MensProducts.dart';
import 'package:shop_now/Views/ProductDetails.dart';
import 'package:shop_now/Views/Search.dart';
import 'package:shop_now/providers/cartprovider.dart';
// import 'package:http/http.dart' as http;

import '../providers/themeProvider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

  int ind = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    List imageList = [
      {'id': 1, 'image_path': 'assets/images/iphone13_1.jpg'},
      {'id': 2, 'image_path': 'assets/images/jacket1.jpg'},
      {'id': 3, 'image_path': 'assets/images/pack1.jpg'},
      {'id': 4, 'image_path': 'assets/images/pantblue1.jpg'},
      {'id': 5, 'image_path': 'assets/images/vintage1.jpg'},
      {'id': 6, 'image_path': 'assets/images/oppo1.jpg'},
      {'id': 7, 'image_path': 'assets/images/sofa.jpg'},
      {'id': 8, 'image_path': 'assets/images/bed.jpg'},
      {'id': 9, 'image_path': 'assets/images/nike1.jpg'},
    ];

    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        centerTitle: true,
        title: Text(
          "Shopper’S Delight",
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: whitecolor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            icon: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddtoCart(),
                      ));
                },
                child: Badge(
                  child: Icon(Icons.shopping_cart_outlined),
                  label: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Text(cart.cartlist.length.toString());
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            CarouselSlider(
              items: imageList
                  .map(
                    (items) => Image.asset(
                      items['image_path'],
                      // fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    //
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                height: 180,
                scrollPhysics: BouncingScrollPhysics(),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
                onPageChanged: (i, reason) {
                  setState(() {
                    ind = i;
                  });
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Categories',
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 10,
                    ),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: appcolor,
                    ),
                    child: Icon(Icons.category),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MensPoduct(),
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 10,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/men.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Mens',
                          style: GoogleFonts.aboreto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/female');
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 10,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/women.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Women',
                          style: GoogleFonts.aboreto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/furniture');
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 10,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/chair.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Furniture',
                          style: GoogleFonts.aboreto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/phones');
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 10,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/samsung1.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Phones',
                          style: GoogleFonts.aboreto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/appliances');
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 10,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/juicer.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Home Aplliances',
                          style: GoogleFonts.aboreto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Popular Products',
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      shrinkWrap: true,
                      itemCount: ProdustListing.quikOrder.length,
                      itemBuilder: (context, index) {
                        var data = ProdustListing.quikOrder[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(data: data),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            // height: 100,
                            // width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('${data.imageUrl1}'))),
                            // child: Text('Hello ${index}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
