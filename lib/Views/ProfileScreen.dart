import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/UI%20Helper/Alert.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/UI%20Helper/Fluttertoast.dart';
import 'package:shop_now/Views/Editprofile.dart';
import 'package:shop_now/Views/Privacy.dart';
import 'package:shop_now/Views/TermsAndCondition.dart';

import '../providers/themeProvider.dart';
import 'SettingScreen.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DialogUtils dialog = DialogUtils();
  @override
  void initState() {
    super.initState();
    getpref();
  }

  String? imageUrl;
  String? name;
  String? email;
  String? dob;

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
        title: Text('MY PROFILE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    imageUrl == null
                        ? Icon(
                            Icons.person,
                            size: 100,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File(imageUrl!),
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name != null
                          ? name.toString()
                          : 'Muhammad Osama Farooqui',
                      style: GoogleFonts.adamina(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      email != null ? email.toString() : 'example@gmail.com',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      dob != null ? dob.toString() : '19-04-2000',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: appcolor),
              title: Text('Edit Profile'),
              trailing: Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: appcolor,
              ),
              onTap: () {
                // Navigate to the edit profile screen.
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => EditProfile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: appcolor),
              title: Text('Settings'),
              trailing: Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: appcolor,
              ),
              onTap: () {
                // Navigate to the settings screen.
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.policy, color: appcolor),
              title: Text('Privacy Policy'),
              trailing: Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: appcolor,
              ),
              onTap: () {
                // Navigate to the privacy policy screen.
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PrivacyPolicy()));
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: appcolor),
              title: Text('Terms & Conditions'),
              trailing: Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: appcolor,
              ),
              onTap: () {
                // Navigate to the terms & conditions screen.
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TermsAndCondition()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: appcolor),
              title: Text('Logout'),
              trailing: Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: appcolor,
              ),
              onTap: () {
                final auth = FirebaseAuth.instance;

                DialogUtils.showCustomDialog(context,
                    title: 'Are you sure you want to log out?',
                    cancelBtnText: 'Cancel',
                    okBtnText: 'Logout', okBtnFunction: () {
                  auth
                      .signOut()
                      .then((value) => {
                            Navigator.pushReplacementNamed(context, '/login'),
                          })
                      .onError((error, stackTrace) => {
                            FlutterToastMessage()
                                .toastMessage(error.toString()),
                          });
                });
                // Implement the logout functionality here.
                // You can clear user data, sign out, etc.
                // For simplicity, we just navigate back to the previous screen.
              },
            ),
          ],
        ),
      ),
    );
  }

  void getpref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var image = pref.getString('imageUrl');
    var name1 = pref.getString('name');
    var email1 = pref.getString('email');
    var dob1 = pref.getString('dob');
    setState(() {
      imageUrl = image;
      name = name1;
      email = email1;
      dob = dob1;
    });
  }
}
