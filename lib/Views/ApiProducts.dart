import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/Models/ApiModel.dart';
// import 'package:shop_now/Models/Productlist.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';
import 'package:shop_now/Views/AddToCard.dart';
import 'package:shop_now/Views/CheckOut.dart';
import 'package:shop_now/providers/cartprovider.dart';
import '../providers/themeProvider.dart';

class ProductDetails1 extends StatefulWidget {
  final ApiModel data;
  ProductDetails1({super.key, required this.data});

  @override
  State<ProductDetails1> createState() => _ProductDetails1State(data: data);
}

class _ProductDetails1State extends State<ProductDetails1> {
  final ApiModel data;
  _ProductDetails1State({required this.data});
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    // print('obj');
    bool isFav = false;
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.transparent : appcolor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Product Detail',
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
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
                  child: Icon(Icons.shopping_cart),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${data.title}',
                    style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Price',
                  style: GoogleFonts.adamina(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${data.price}',
                      style: GoogleFonts.adamina(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      // width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow,
                          ),
                          Text(
                            '4.7',
                            style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? Colors.transparent : whitecolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 12.0, top: 12),
                //   child: Image(
                //     image: NetworkImage(
                //       data.image,
                //     ),
                //     height: 140,
                //   ),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 350,
                        child: Text(
                          data.description.toString().trimRight(),
                          style: GoogleFonts.adamina(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            customIcom(FontAwesomeIcons.minus, () {
                              // print('tap');
                              if (count > 1) {
                                // cart.subcountfun();
                                setState(() {
                                  count--;
                                });
                              }
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            // Consumer<CartProvider>(
                            //   builder: (context, value, child) {
                            //     return '
                            Text(
                              count.toString(),
                              style: GoogleFonts.adamina(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              //   );
                              // },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            customIcom(
                              Icons.add,
                              () {
                                // cart.countfun();
                                setState(() {
                                  count++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('clicked');
                          // cart.addfavData(data);
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
                              // ignore: dead_code
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          double totalprice = data.price!.toDouble() * count;
                          print(totalprice);
                          // cart.addData1(data, count, totalprice);
                          FlutterToastMessage().toastMessage('Add to cart');
                          setState(() {
                            count = 1;
                          });
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddtoCart(),
                          //   ),
                          // );
                          // cart.countZero();
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          var totalprice = data.price! * count;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Checkout(totalAmount: totalprice.toInt()),
                              ));
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'BUY NOW',
                              style: GoogleFonts.adamina(
                                fontWeight: FontWeight.bold,
                                color: whitecolor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //
    );
  }

  Widget customIcom(IconData addIcon, Function tapFunc) {
    return GestureDetector(
      onTap: () {
        tapFunc();
      },
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: appcolor.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(addIcon),
      ),
    );
  }
}
