import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/CheckOut.dart';
import 'package:provider/provider.dart';
import '../UI Helper/Fluttertoast.dart';
import '../providers/cartprovider.dart';
import '../providers/themeProvider.dart';

class AddtoCart extends StatefulWidget {
  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MY CART',
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
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
        ],
      ),
      body: cart.cartlist.isEmpty
          ? Center(
              child: Text(
                'No item in cart',
              ),
            )
          : ListView.builder(
              itemCount: cart.cartlist.length,
              itemBuilder: (context, index) {
                var cartitems = cart.cartlist[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(cartitems.imageUrl1.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      '${cartitems.title}',
                      style: GoogleFonts.adamina(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        cart.removeItem(index);
                        FlutterToastMessage().toastMessage('Remove from cart');
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${cartitems.totalprice}',
                              style: GoogleFonts.adamina(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                customIcom(FontAwesomeIcons.minus, () {
                                  // print('tap');
                                  if (cartitems.count! > 0) {
                                    // cart.subcountfun();
                                    setState(() {
                                      cartitems.count = cartitems.count! - 1;
                                      // var newPrice = cartitems.totalprice! -
                                      //     cartitems.initialprice!;
                                      cartitems.totalprice =
                                          cartitems.totalprice! -
                                              cartitems.initialprice!;
                                    });
                                  }
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                // Consumer<CartProvider>(
                                //   builder: (context, value, child) {
                                //     return
                                Text(
                                  cartitems.count.toString(),
                                  style: GoogleFonts.adamina(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
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
                                      cartitems.count = cartitems.count! + 1;
                                      cartitems.totalprice =
                                          cartitems.totalprice! +
                                              cartitems.initialprice!;
                                    });
                                  },
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
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 150,
        decoration: BoxDecoration(
          color: appcolor.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.adventPro(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${cart.totalPrice}',
                  style: GoogleFonts.adventPro(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                var totalAmount = cart.totalPrice;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(
                        totalAmount: totalAmount,
                      ),
                    ));
              },
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: appcolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Check Out',
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
    );
  }

  Widget customIcom(IconData addIcon, Function tapFunc) {
    return GestureDetector(
      onTap: () {
        tapFunc();
      },
      child: Container(
        padding: EdgeInsets.all(7),
        child: Icon(
          addIcon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
