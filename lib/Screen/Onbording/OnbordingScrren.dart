import 'dart:async';

import 'package:flutter/material.dart';

import '../LoginScreen/LoginScrren.dart';
import 'OndordingCount.dart';
import 'onbording_Model.dart';

class OnbordingScrren extends StatefulWidget {
  @override
  State<OnbordingScrren> createState() => _OnbordingScrrenState();
}

class _OnbordingScrrenState extends State<OnbordingScrren> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;
  final List<OnBoard> demoData = [
    OnBoard(
      image: "assets/images/Group 88@3x.png",
      title: "Title 01",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoard(
      image: "assets/images/Group 88@3x.png",
      title: "Title 02",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoard(
      image: "assets/images/Group 88@3x.png",
      title: "Title 03",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
            itemCount: demoData.length,
            controller: _pageController,
            itemBuilder: (context, index) => OnBoardContent(
              title: demoData[index].title,
              description: demoData[index].description,
              image: demoData[index].image,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  demoData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text("By proceeding you agree to our Privacy Policy"),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 48),
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.brown[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Login / Registration",
                  style: TextStyle(
                    fontFamily: "HappyMonkey",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
