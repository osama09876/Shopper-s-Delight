import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shop_now/UI%20Helper/myButton.dart';
import 'package:shop_now/Views/Bottomnav.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  final List<String> titles = [
    "Welcome to Our Shop",
    "Browse and Shop",
    "Easy Checkout",
  ];
  final List<String> descriptions = [
    "Find the best products and deals in our shop.",
    "Browse through various categories and shop your favorites.",
    "Enjoy a seamless checkout experience with multiple payment options.",
  ];
  final List<String> imageAssets = [
    "assets/images/vector1.png",
    "assets/images/vector3.png",
    "assets/images/vector2.png",
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: descriptions.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image(image: AssetImage(imageAssets[i])),
                      Text(
                        titles[i],
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        descriptions[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                descriptions.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          // Container(
          //   height: 60,
          //   margin: EdgeInsets.all(40),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   child: ElevatedButton(
          //     child: Text(
          //         currentIndex == descriptions.length - 1 ? "Continue" : "Next",
          //         style: GoogleFonts.adventPro(
          //           // color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 25,
          //         )),
          //     onPressed: () {
          //       if (currentIndex == descriptions.length - 1) {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (_) => Bottomnav(),
          //           ),
          //         );
          //       }
          //       _controller.nextPage(
          //         duration: Duration(milliseconds: 100),
          //         curve: Curves.bounceIn,
          //       );
          //     },
          //   ),
          // )
          MyButton(
            txt: currentIndex == descriptions.length - 1 ? "Continue" : "Next",
            myFunc: () {
              if (currentIndex == descriptions.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Bottomnav(),
                  ),
                );
              }
              _controller.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
