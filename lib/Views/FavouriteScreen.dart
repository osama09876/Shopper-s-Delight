import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';
import 'package:shop_now/providers/cartprovider.dart';
import 'package:shop_now/providers/themeProvider.dart';
// import 'package:shop_now/Models/Productlist.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final themeprovider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor:
          themeprovider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        backgroundColor:
            themeprovider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'favorite Products',
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cart.favlist.isEmpty
          ? Center(
              child: Text(
                'No item',
              ),
            )
          : ListView.builder(
              itemCount: cart.favlist.length,
              itemBuilder: (context, index) {
                var cartitems = cart.favlist[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          child: Image(
                            image: AssetImage(cartitems.imageUrl1.toString()),
                          ),
                        ),
                        title: Text(
                          '${cartitems.title}',
                          style: GoogleFonts.adamina(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            cart.removefavItem(index);
                            FlutterToastMessage()
                                .toastMessage('Remove from favorite');
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: appcolor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            '\$ ${cartitems.cost}',
                            style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
