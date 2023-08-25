// import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';
import 'package:shop_now/UI%20Helper/InputFeild.dart';
import 'package:shop_now/UI%20Helper/myButton.dart';

import '../providers/themeProvider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isVisible = true;
  bool is_Visible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  bool loader = false;

  void signup() {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) => {
              Navigator.pushNamed(context, '/login'),
            })
        .onError((error, stackTrace) => {
              FlutterToastMessage().toastMessage(error.toString()),
            });
  }

  @override
  void dispose() {
    // nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
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
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Account',
                style: GoogleFonts.aboreto(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: appcolor,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Complete your details or continue \n           social media.',
                style: GoogleFonts.abyssinicaSil(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
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
                        controller: emailController,
                        focusnode: emailFocusNode),
                    SizedBox(height: 20),
                    CustomInputFeild(
                      label: 'Password',
                      obscure: isVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }

                        return null;
                      },
                      prefixicon: Icons.lock,
                      controller: passwordController,
                      focusnode: passwordFocusNode,
                      suffixFunc: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      suffixIcon:
                          isVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    SizedBox(height: 20),
                    CustomInputFeild(
                      label: 'Confirm Password',
                      obscure: is_Visible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value != passwordController.text) {
                          return 'Password not match';
                        }
                        return null;
                      },
                      prefixicon: Icons.lock,
                      controller: confirmPasswordController,
                      focusnode: confirmPasswordFocusNode,
                      suffixFunc: () {
                        setState(() {
                          is_Visible = !is_Visible;
                        });
                      },
                      suffixIcon:
                          is_Visible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyButton(
                txt: 'REGISTER',
                myFunc: () {
                  if (formKey.currentState!.validate()) {
                    signup();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.google),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
