import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/Bottomnav.dart';
import 'package:shop_now/Views/Dashboard.dart';
import 'package:shop_now/Views/FavouriteScreen.dart';
import 'package:shop_now/Views/Furniture.dart';
import 'package:shop_now/Views/Loginscreen.dart';
import 'package:shop_now/Views/MobileProduct.dart';
import 'package:shop_now/Views/SignupScreen.dart';
import 'package:shop_now/Views/SplashScreen.dart';
import 'package:shop_now/Views/Wallet.dart';
import 'package:shop_now/Views/femalproduct.dart';
import 'package:shop_now/Views/onboardingScreen.dart';
import 'package:shop_now/providers/cartprovider.dart';
import 'package:shop_now/providers/themeProvider.dart';

import 'Views/homeAppliances.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Shopping's Delight",
            theme: themeProvider.isDarkMode
                ? ThemeData(brightness: Brightness.dark)
                : ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: appcolor,
                  ),
            routes: {
              '/': (context) => Splash(),
              '/login': (context) => LoginScreen(),
              '/signup': (context) => SignupScreen(),
              '/dashboard': (context) => Dashboard(),
              '/favourite': (context) => FavouriteScreen(),
              '/wallet': (context) => WalletScreen(),
              '/bottomnav': (context) => Bottomnav(),
              '/phones': (context) => PhoneCollections(),
              '/onboard': (context) => OnboardingScreen(),
              '/female': (context) => WomensPoduct(),
              '/furniture': (context) => Furniture(),
              '/appliances': (context) => HomeAppliances(),
            },
          );
        },
      ),
    );
  }
}
