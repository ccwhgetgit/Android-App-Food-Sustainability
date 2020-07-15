import 'package:flutter/material.dart';
import 'package:Cycled_iOS/onboarding/slider.dart';

import '../authentication.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Welcome to Cycled",
        description: "Make cents and sense\nwith your food waste!",
        image: "assets/images/Welcome.png"),
    SliderPage(
        title: "Trash is Cash",
        description: "Dispose your food waste to earn exciting rewards ",
        image: "assets/images/secondscreen.png"),
    SliderPage(
        title: "Learn and Earn",
        description:
            "Learn with us to save our environment for a better tomorrow",
        image: "assets/images/third.png"),
    SliderPage(
        title: "Connected Communities",
        description: "Share food waste with your neighbours and be part of the green movement ",
        image: "assets/images/Eat and Shop.png"),
    SliderPage(
        title: "Every little effort counts",
        description: "Are you ready?",
        image: "assets/images/community.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.green
                                : Colors.green.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 900),
                      curve: Curves.easeInOutQuint);
                },

                //the arrow
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 200),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? //to move onto the next page
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green[800],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Get Cycled!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                            ),
                          ))
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
