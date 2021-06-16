import 'package:app2/constants/Warna.dart';
import 'package:app2/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnBoardModel({
    this.img,
    this.text,
    this.desc,
    this.bg,
    this.button,
  });
}

List<OnBoardModel> screens = <OnBoardModel>[
  OnBoardModel(
    img: "assets/images/gendang.png",
    text: "Ini Gendang",
    desc:
        "On Boarding adalah sebuah cara untuk menyampaikan tujuan aplikasi dengan ringkas",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: "assets/images/gitar.png",
    text: "Ini Gitar",
    desc:
        "On Boarding adalah sebuah cara untuk menyampaikan tujuan aplikasi dengan ringkas",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: "assets/images/logobmr.png",
    text: "Ini Logo BMR",
    desc:
        "On Boarding adalah sebuah cara untuk menyampaikan tujuan aplikasi dengan ringkas",
    bg: Colors.white,
    button: Colors.blue,
  ),
];

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("onBoard", isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              await _storeOnBoardInfo();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text("Skip"),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(screens[index].img),
                Container(
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: currentIndex == i ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == i
                                  ? Colors.lightBlue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      screens[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        screens[index].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (index != 0) {
                          _pageController.previousPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          // horizontal: 32,
                          vertical: 12,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Back",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.lightBlue,
                      onTap: () async {
                        if (index == screens.length - 1) {
                          await _storeOnBoardInfo();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                        _pageController.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.bounceInOut,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          // horizontal: 32,
                          vertical: 12,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Warna.biru,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Next",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
    );
  }
}
