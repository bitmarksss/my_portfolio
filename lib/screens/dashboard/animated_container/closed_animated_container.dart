import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../../../constants/app.dart';

class ClosedAnimatedContainer extends StatelessWidget {
  final String image;
  final String project;

  const ClosedAnimatedContainer({
    Key? key,
    required this.image,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 1280,
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Colors.black,
                  AppConstants.darkBackgroundColor,
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              project,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Bold',
                fontSize: AppConstants.font5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
