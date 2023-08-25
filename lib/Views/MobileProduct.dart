import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/Models/Productlist.dart';
import 'package:shop_now/Views/ProductDetails.dart';
import 'package:shop_now/providers/cartprovider.dart';

import '../UI Helper/Customcolor.dart';
import '../UI Helper/Fluttertoast.dart';
import '../providers/themeProvider.dart';
// import 'package:shop_now/Models/Productlist.dart';

class PhoneCollections extends StatefulWidget {
  PhoneCollections({super.key});

  @override
  State<PhoneCollections> createState() => _PhoneCollectionsState();
}

class _PhoneCollectionsState extends State<PhoneCollections> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = false;
    final cart = Provider.of<CartProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : appcolor.shade100,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : appcolor.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Phones Collections',
          style: GoogleFonts.adamina(),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: ProdustListing.phoneList.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var data = ProdustListing.phoneList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(data: data),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(
                              data.imageUrl1.toString(),
                            ),
                            height: 80,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.title.toString(),
                            style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${data.cost.toString()} ',
                                style: GoogleFonts.adamina(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('clicked');
                                  cart.addfavData(data);
                                  FlutterToastMessage()
                                      .toastMessage('Add to favourite');
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => FavouriteScreen(),
                                  //     ));
                                  setState(() {
                                    isFav = !isFav;
                                  });
                                },
                                child: Icon(
                                  color: appcolor,
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
