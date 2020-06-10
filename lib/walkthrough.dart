import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {

  String title;
  String content;
  IconData imageIcon;
  Color imageColor;

  Walkthrough({this.title, this.content, this.imageColor = Colors.redAccent, this.imageIcon});

  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut
    ));

    animation.addListener((){
      setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(widget.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(
                widget.content,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ),
            Icon(widget.imageIcon, size: 100.0, color: widget.imageColor,)
          ],
        ),
      ),
    );
  }
}

