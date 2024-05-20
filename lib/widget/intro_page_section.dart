import 'package:flutter/material.dart';

class ImgSec extends StatelessWidget {
  final String path;
  final double width, height;
  const ImgSec(
      {super.key,
      required this.path,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            path,
            fit: BoxFit.fill,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }
}
