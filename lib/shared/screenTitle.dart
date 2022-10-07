import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      curve: Curves.bounceInOut,
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: _val * 50),
            child: child,
          ),
        );
      },
    );
  }
}
