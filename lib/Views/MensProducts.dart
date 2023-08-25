import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/Models/Productlist.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/ProductDetails.dart';
import '../UI Helper/Fluttertoast.dart';
import '../providers/cartprovider.dart';
import '../providers/themeProvider.dart';

class MensPoduct extends StatefulWidget {
  MensPoduct({super.key});

  @override
  State<MensPoduct> createState() => _MensPoductState();
}

class _MensPoductState extends State<MensPoduct> {
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    bool isFav = false;
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : appcolor.shade100,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : appcolor.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Mens Collections',
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
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: ProdustListing.menswearlist.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final data = ProdustListing.menswearlist[index];
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
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
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
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
                  ),
                );
              },
            ),
    );
  }
}
