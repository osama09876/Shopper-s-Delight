import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Alert.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';
import 'package:shop_now/UI%20Helper/InputFeild.dart';
import 'package:shop_now/UI%20Helper/myButton.dart';

import '../UI Helper/Customcolor.dart';
import '../providers/themeProvider.dart';
import 'Forgetpass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberMe = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) => {
              DialogUtils.showCustomDialog(
                context,
                title: 'Successfully Login',
                okBtnText: 'OK',
                cancelBtnText: 'Cancel',
                okBtnFunction: () {
                  Navigator.pushReplacementNamed(context, '/onboard');
                },
              ),
            })
        .onError((error, stackTrace) => {
              FlutterToastMessage().toastMessage(error.toString()),
            });
  }

  void performFacebookLogin() async {}

  void performTwitterLogin() {
    // Perform Twitter login action here
  }

  void performGoogleLogin() {
    // Perform Google login action here
  }

  void _onRememberMeChanged(newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
        } else {}
      });

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sign in',
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.aboreto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: appcolor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign in with your email and password \n     or continue with social media',
                  style: GoogleFonts.abyssinicaSil(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomInputFeild(
                  label: 'Email',
                  obscure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid email';
                    }
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  prefixicon: Icons.email,
                  controller: emailcontroller,
                  focusnode: emailFocusNode,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomInputFeild(
                  label: 'Password',
                  obscure: isVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password length should be 6';
                    }
                    return null;
                  },
                  prefixicon: Icons.lock,
                  controller: passwordcontroller,
                  focusnode: passwordFocusNode,
                  suffixFunc: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  suffixIcon: isVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: _onRememberMeChanged,
                      ),
                      Text(
                        'Remember Me',
                        style: GoogleFonts.abyssinicaSil(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPass(),
                              ));
                        },
                        child: Text(
                          'Forgot password',
                          style: GoogleFonts.abyssinicaSil(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                MyButton(
                  txt: 'Login',
                  myFunc: () {
                    if (formKey.currentState!.validate() &&
                        rememberMe == true) {
                      login();
                    }
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: performFacebookLogin,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: performTwitterLogin,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.google),
                      onPressed: performGoogleLogin,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        " Register",
                        style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: appcolor,
                        ),
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
  }
}
