library flutterwalkthrough;

import 'package:flutter/material.dart';
import 'package:walkthrough/walkthrough.dart';

/// A IntroScreen Class.
class IntroScreen extends StatefulWidget {

  List<Walkthrough> walkthroughList;
  MaterialPageRoute pageRoute;

  IntroScreen(this.walkthroughList, this.pageRoute);

  void skipPage(BuildContext context){
    Navigator.of(context).push(pageRoute);
  }

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  PageController pageController = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: new Color(0xFFEEEEEE),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(),
          ),
          Expanded(
            flex: 3,
            child: new PageView(
              children: widget.walkthroughList,
              controller: pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    lastPage ? "" : "SKIP",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  onPressed: (){
                    lastPage ? null : widget.skipPage(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    lastPage ? "GOT IT" : "NEXT",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  onPressed: (){
                    lastPage ? widget.skipPage(context) : pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

