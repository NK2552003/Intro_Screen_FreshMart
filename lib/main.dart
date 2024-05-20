import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(IntroScreen());
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _controller;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: const [
                      _IntroPage(
                        imagePath: 'Assets/1.png',
                        description:
                            "we're here to provide you with the freshest produce,finest Vegetables",
                      ),
                      _IntroPage(
                        imagePath: 'Assets/2.png',
                        description:
                            "Pantry essentials to help you create delicious meals for you and your family",
                      ),
                      _IntroPage(
                        imagePath: 'Assets/5.png',
                        description:
                            "Let's Add your Favourite thing to your Cart!",
                      ),
                    ],
                  ),
                  Positioned(
                      top: 130,
                      child: Column(
                        children: [
                          Text(
                            "Welcome To FreshMart!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black
                                      .withOpacity(0.5), // Shadow color
                                  offset: Offset(2, 2), // Shadow position
                                  blurRadius: 2, // Shadow blur radius
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "one-stop destination for fresh & high-quality groceries!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              shadows: [
                                Shadow(
                                  color: Colors.black
                                      .withOpacity(0.5), // Shadow color
                                  offset: Offset(0.5, 0.5), // Shadow position
                                  blurRadius: 3, // Shadow blur radius
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    bottom: 130,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == i
                                  ? Colors.blueGrey.shade900
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 20,
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20), // Add margin if needed
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(16), // Add border radius
                        color: Colors.blueGrey.shade900, // Change button color
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blueGrey.shade900, // Change button color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Add padding
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white, // Change text color
                            fontSize: 18, // Change text size
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroPage extends StatelessWidget {
  final String imagePath;
  final String description;

  const _IntroPage({
    required this.imagePath,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 400, height: 200),
        SizedBox(height: 20), // Adjusted the height here
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blueGrey.shade900,
                fontSize: 30,
                fontWeight: FontWeight.w400), // Adjusted the font size here
          ),
        ),
      ],
    );
  }
}
