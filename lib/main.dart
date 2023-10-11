import 'package:flutter/material.dart';
import 'package:pageview_and_expansion_panel/pages/expansion_panel.dart';
import 'package:pageview_and_expansion_panel/pages/one.dart';
import 'package:pageview_and_expansion_panel/pages/three.dart';
import 'package:pageview_and_expansion_panel/pages/two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // remove the debug banner
        debugShowCheckedModeBanner: false,
        home: PageViewSection());
  }
}

// Construct Dots Indicator

class PageViewSection extends StatefulWidget {
  const PageViewSection({Key? key}) : super(key: key);

  @override
  State<PageViewSection> createState() => _PageViewSectionState();
}

class _PageViewSectionState extends State<PageViewSection> {
  // declare and initizlize the page controller
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      // Navigate to a new screen using Navigator.push
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyExpansionPanelList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                      backgroundColor: Color.fromARGB(255, 34, 149, 5),
                      foregroundColor: Color.fromARGB(255, 219, 214, 214),
                    ),
                    child: Text("Skip")),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        _pages.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: _activePage == index
                                      ? Color.fromARGB(255, 52, 208, 13)
                                      : Colors.grey,
                                ),
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
