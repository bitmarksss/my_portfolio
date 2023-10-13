import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:portfolio/constants/app.dart';

class OpenedAnimatedContainer extends StatelessWidget {
  final String image;
  final String project;

  const OpenedAnimatedContainer({
    Key? key,
    required this.image,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstants.darkBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.verticalWidgetPadding),
              child: Text(
                project,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Bold',
                  fontSize: AppConstants.font1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
