import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio/constants/app.dart';
import 'package:portfolio/screens/dashboard/animated_container/my_animated_container.dart';

import 'animated_container/closed_animated_container.dart';
import 'animated_container/opened_animated_container.dart';

final List<String> projectImages = [
  'assets/images/projects/madayaw-gas.png',
  'assets/images/projects/aquamonitor.png',
];
final List<String> projectNames = [
  'Madayaw Gas',
  'AquaMonitor',
];
final Map<String, dynamic> projectTechnologies = {
  'Madayaw Gas': ['Laravel', 'Bootstrap', 'HTML', 'CSS', 'MySQL'],
  'AquaMonitor': ['Flutter', 'Laravel', 'MySQL'],
};

class PortfolioDashboard extends StatefulWidget {
  const PortfolioDashboard({Key? key}) : super(key: key);

  @override
  State<PortfolioDashboard> createState() => _PortfolioDashboardState();
}

class _PortfolioDashboardState extends State<PortfolioDashboard> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _visibilityKey = GlobalKey();

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Attach the listener to the ScrollController
    _scrollController.addListener(() {
      // Find the RenderBox of the tracked widget
      final RenderBox renderBox = _visibilityKey.currentContext!.findRenderObject() as RenderBox;

      // Calculate the positions
      final widgetPosition = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;

      // Check if the widget is within the visible screen area
      if (widgetPosition.dy > 0 && widgetPosition.dy < screenHeight) {
        setState(() {
          _isVisible = true;
          print(_isVisible);
        });
      } else {
        setState(() {
          _isVisible = false;
          print(_isVisible);
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<Widget> imageSliders = projectImages.map((image) {
    ContainerTransitionType transitionType = ContainerTransitionType.fade;
    final String project = projectNames[projectImages.indexOf(image)];
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: OpenContainer<bool>(
        transitionType: transitionType,
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return OpenedAnimatedContainer(
            image: image,
            project: project,
          );
        },
        closedShape: const RoundedRectangleBorder(),
        closedElevation: 0.0,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return ClosedAnimatedContainer(
            image: image,
            project: project,
          );
        },
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstants.darkBackgroundColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: const Divider(color: Colors.green),
                ),
                SizedBox(
                  height: screenHeight * 0.65,
                  width: screenWidth,
                  child: profileStack(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.verticalWidgetPadding,
                      horizontal: AppConstants.horizontalWidgetPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppConstants.verticalWidgetPadding,
                            horizontal: AppConstants.horizontalWidgetPadding),
                        child: Text(
                          'I enjoy developing beautiful, intuitive, and '
                          '\nresponsive mobile applications. I have developed'
                          '\napplications using various up-to-date'
                          '\ntechnologies to provide solutions to modern '
                          '\nproblems.',
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: AppConstants.darkTextColor,
                              fontSize: AppConstants.font5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: AppConstants.verticalWidgetPadding * 2),
                        child: Text(
                          'My skills in software development include:',
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: AppConstants.darkTextColor,
                              fontFamily: 'SF Pro Bold',
                              fontSize: AppConstants.font5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppConstants.verticalWidgetPadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.html5,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  HTML5',
                                      style: TextStyle(
                                          overflow: TextOverflow.fade,
                                          color: AppConstants.darkTextColor,
                                          fontFamily: 'SF Pro Medium',
                                          fontSize: AppConstants.font6),
                                    ),
                                  ],
                                ),
                                Text('  '),
                                Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.css3,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  CSS3',
                                      style: TextStyle(
                                          overflow: TextOverflow.fade,
                                          color: AppConstants.darkTextColor,
                                          fontFamily: 'SF Pro Medium',
                                          fontSize: AppConstants.font6),
                                    ),
                                  ],
                                ),
                                Text('  '),
                                Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.laravel,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  Laravel',
                                      style: TextStyle(
                                          overflow: TextOverflow.fade,
                                          color: AppConstants.darkTextColor,
                                          fontFamily: 'SF Pro Medium',
                                          fontSize: AppConstants.font6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      BoxIcons.bxl_flutter,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  Flutter',
                                      style: TextStyle(
                                          overflow: TextOverflow.fade,
                                          color: AppConstants.darkTextColor,
                                          fontFamily: 'SF Pro Medium',
                                          fontSize: AppConstants.font6),
                                    ),
                                  ],
                                ),
                                Text('  '),
                                Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.database,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  MySQL',
                                      style: TextStyle(
                                          overflow: TextOverflow.fade,
                                          color: AppConstants.darkTextColor,
                                          fontFamily: 'SF Pro Medium',
                                          fontSize: AppConstants.font6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: AppConstants.verticalWidgetPadding * 2),
                        child: Text(
                          'Projects I have collaborated on:',
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: AppConstants.darkTextColor,
                              fontFamily: 'SF Pro Bold',
                              fontSize: AppConstants.font4),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: AppConstants.titleWidgetPadding),
                        width: screenWidth - 20,
                        child: CarouselSlider(
                          items: imageSliders,
                          carouselController: carouselController,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(AppConstants.horizontalWidgetPadding,
                      AppConstants.titleWidgetPadding, AppConstants.horizontalWidgetPadding, 0),
                  child: Text(
                    'Contact me!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro Bold',
                      fontSize: AppConstants.font4,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              icon: FadeInUp(
                                  animate: _isVisible,
                                  from: 50,
                                  child:
                                      const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white)),
                              onPressed: () {},
                            ),
                            FadeIn(
                              animate: _isVisible,
                              child: const Text(
                                'LinkedIn',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              icon: FadeInUp(
                                  animate: _isVisible,
                                  from: 100,
                                  child:
                                      const FaIcon(FontAwesomeIcons.github, color: Colors.white)),
                              onPressed: () {},
                            ),
                            FadeIn(
                              animate: _isVisible,
                              child: const Text(
                                'GitHub',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              icon: FadeInUp(
                                  animate: _isVisible,
                                  from: 150,
                                  child:
                                      const FaIcon(FontAwesomeIcons.google, color: Colors.white)),
                              onPressed: () {},
                            ),
                            FadeIn(
                              animate: _isVisible,
                              child: const Text(
                                'Gmail',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              icon: FadeInUp(
                                  animate: _isVisible,
                                  from: 200,
                                  child:
                                      const FaIcon(FontAwesomeIcons.facebook, color: Colors.white)),
                              onPressed: () {},
                            ),
                            FadeIn(
                              animate: _isVisible,
                              child: const Text(
                                'Facebook',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              icon: FadeInUp(
                                  animate: _isVisible,
                                  from: 250,
                                  child:
                                      const FaIcon(FontAwesomeIcons.twitter, color: Colors.white)),
                              onPressed: () {},
                            ),
                            FadeIn(
                              animate: _isVisible,
                              child: const Text(
                                'Twitter',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  key: _visibilityKey,
                  height: screenHeight * 0.1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileStack(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.transparent,
                AppConstants.darkBackgroundColor,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            'assets/images/profile/cropped_profile.png',
            fit: BoxFit.contain,
          ),
        ),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.widgetPadding, vertical: AppConstants.titleWidgetPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hello! i am',
                  style: TextStyle(
                    color: AppConstants.darkTextColor,
                    // color: Colors.white,
                    fontSize: AppConstants.font1,
                    fontFamily: 'SF Pro Bold',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(
                          4,
                          4,
                        ),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Mark Alfred',
                  style: TextStyle(
                    color: AppConstants.darkTextColor,
                    // color: Colors.white,
                    fontSize: AppConstants.fontHighlight,
                    fontFamily: 'SF Pro Black',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(
                          7,
                          7,
                        ),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Calledo',
                  style: TextStyle(
                    color: AppConstants.darkTextColor,
                    // color: Colors.white,
                    fontSize: AppConstants.fontHighlight,
                    fontFamily: 'SF Pro Black',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(
                          7,
                          7,
                        ),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
