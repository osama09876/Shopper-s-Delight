import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:shop_now/UI%20Helper/Balance.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/providers/cartprovider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.shade100,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'MY WALLET',
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: appcolor.shade100,
            child: Column(
              children: [
                Text(
                  'Available Balance',
                  style: GoogleFonts.adamina(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '\$ ${cart.balance}',
                  style: GoogleFonts.adamina(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: appcolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Deposite',
                        style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.account_balance_outlined),
                    Text('Balance Details'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.mobile_friendly),
                    Text('Mobile Top Up'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.pages_outlined),
                    Text('Vouchers'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'All Transactions',
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.paymentDetailslist.length,
              itemBuilder: (context, index) {
                var data = cart.paymentDetailslist[index];
                return ListTile(
                  leading: Icon(
                    Icons.shopping_cart_checkout,
                    color: appcolor,
                  ),
                  title: Text(
                    'Purchace',
                    style: GoogleFonts.adamina(
                      // fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(' ${data.paymentDate}'),
                  trailing: Column(
                    children: [
                      Text(
                        'Success',
                        style: GoogleFonts.adamina(
                          // fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '\$ ${data.amount}',
                        style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
