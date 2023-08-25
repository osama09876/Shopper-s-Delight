import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UI Helper/Fluttertoast.dart';
import '../UI Helper/InputFeild.dart';
import '../providers/themeProvider.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isEdit = false;
  // final databaseRef = FirebaseDatabase.instance.ref('Profile');

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      // backgroundColor: Color.fromARGB(255, 55, 89, 99),
      appBar: AppBar(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        elevation: 0,
        title: Text(
          'Profile',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isEdit = true;
              });
              Timer(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
                FlutterToastMessage().toastMessage('Added');
              });
              var image = imageFile!.path.toString();
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              pref.setString('imageUrl', image.toString());
              pref.setString('name', namecontroller.text.toString());
              pref.setString('email', emailcontroller.text.toString());
              pref.setString('dob', dateInputController.text.toString());
            },
            icon: isEdit
                ? CircularProgressIndicator()
                : Icon(
                    Icons.done,
                    color: appcolor,
                    size: 35,
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                imageFile == null
                    ? Icon(
                        Icons.person,
                        size: 100,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          imageFile!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                TextButton(
                    onPressed: () async {
                      showImagePicker(context);
                      Map<Permission, PermissionStatus> statuses = await [
                        Permission.storage,
                        Permission.camera,
                      ].request();
                      if (statuses[Permission.storage]!.isGranted &&
                          statuses[Permission.camera]!.isGranted) {
                      } else {
                        print('no permission provided');
                      }
                    },
                    child: Text('Add profile')),
                SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomInputFeild(
                          controller: namecontroller,
                          label: 'Name',
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                          focusnode: nameFocusNode,
                        ),
                        //
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomInputFeild(
                          controller: emailcontroller,
                          label: 'Email',
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your email';
                            }
                            return null;
                          },
                          focusnode: emailFocusNode,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Date',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: appcolor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: appcolor, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: appcolor, width: 1)),
                          ),
                          controller: dateInputController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2050));

                            if (pickedDate != null) {
                              dateInputController.text =
                                  DateFormat('dd MMMM yyyy').format(pickedDate);
                            }
                          },
                        ),
                        // child: CustomInputFeild(
                        //   controller: dateInputController,
                        //   label: 'Date',
                        //   obscure: false,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Select your Date Of Birth';
                        //     }
                        //     return null;
                        //   },
                        //   focusnode: dateFocusNode,
                        //   ontap: () async {
                        //     DateTime? pickedDate = await showDatePicker(
                        //         context: context,
                        //         initialDate: DateTime.now(),
                        //         firstDate: DateTime(1950),
                        //         lastDate: DateTime(2050));

                        //     if (pickedDate != null) {
                        //       dateInputController.text =
                        //           DateFormat('dd MMMM yyyy').format(pickedDate);
                        //     }
                        //   },
                        // ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    final image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageFile = File(image!.path.toString());
    });
  }

  _imgFromCamera() async {
    final image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      imageFile = File(image!.path.toString());
    });
  }

  // void getData() async {
  //   final pref = await SharedPreferences.getInstance();
  //   var name = pref.getString('name');
  //   var email = pref.getString('email');
  //   var dob = pref.getString('dob');
  //   setState(() {

  //   });
  // }
}
