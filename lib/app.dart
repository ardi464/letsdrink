import 'package:flutter/material.dart';
import 'package:letsdrink/pages/about.dart';
import 'package:letsdrink/pages/home.dart';
import 'package:letsdrink/pages/search.dart';
import 'package:page_transition/page_transition.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PageController _pages = PageController(initialPage: 0);
  int pagevalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: BottomAppBar(
            notchMargin: 10,
            shape: CircularNotchedRectangle(),
            color: Colors.white,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pages.jumpToPage(0);
                      });
                    },
                    icon: Icon(Icons.home),
                    iconSize: 35,
                    color: pagevalue == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pages.jumpToPage(1);
                      });
                    },
                    icon: Icon(Icons.info),
                    iconSize: 35,
                    color: pagevalue == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomCenter,
                  child: Search(),
                ),
              );
            },
            child: Icon(Icons.search),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pages,
        onPageChanged: (val) {
          setState(() {
            pagevalue = val;
          });
        },
        children: <Widget>[
          Home(),
          About(),
        ],
      ),
    );
  }
}
