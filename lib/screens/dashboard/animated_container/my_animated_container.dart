import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:portfolio/screens/dashboard/animated_container/closed_animated_container.dart';
import 'package:portfolio/screens/dashboard/animated_container/opened_animated_container.dart';

class MyAnimatedContainer extends StatefulWidget {
  final String image;
  final String project;

  const MyAnimatedContainer({
    Key? key,
    required this.image,
    required this.project,
  }) : super(key: key);

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext _, VoidCallback openContainer) {
        return OpenedAnimatedContainer(
          image: widget.image,
          project: widget.project,
        );
      },
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return ClosedAnimatedContainer(
          image: widget.image,
          project: widget.project,
        );
      },
    );
  }
}
