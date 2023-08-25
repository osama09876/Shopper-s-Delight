import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/Bottomnav.dart';
import 'package:shop_now/Views/Loginscreen.dart';

import '../providers/themeProvider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _toHomeScreen();
  }

  Route _createRoute() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            user != null ? Bottomnav() : LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  void _toHomeScreen() async {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 4000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      body: Center(
        child: Container(
          child: FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'assets/images/appLogo.png',
                // height: 20.h,
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
