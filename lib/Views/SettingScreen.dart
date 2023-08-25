import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/theme.dart';
import '../providers/themeProvider.dart';

class SettingsScreen extends StatelessWidget {
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
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              customRow(Icons.person, 'Personal details'),
              SizedBox(
                height: 20,
              ),
              customRow(Icons.safety_check, 'Password and security'),
              SizedBox(
                height: 20,
              ),
              customRow(Icons.notifications, 'Notifications'),
              SizedBox(
                height: 20,
              ),
              customRow(Icons.lock, 'Privacy'),
              SizedBox(
                height: 20,
              ),
              customRow(Icons.help, 'Help'),
              SizedBox(
                height: 20,
              ),
              customRow(Icons.info, 'Notifications'),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThemeScreen(),
                        ));
                  },
                  child: customRow(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.dark_mode_outlined,
                      'Dark mode')),
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow(IconData myIcon, String txt) {
    return Row(
      children: [
        Icon(myIcon),
        SizedBox(
          width: 10,
        ),
        Text(
          txt.toString(),
          style: GoogleFonts.adamina(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
