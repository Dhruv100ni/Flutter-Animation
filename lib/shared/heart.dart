import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorAnimation;
  Animation _curve;
  Animation<double> _sizeAnimation;

  @override
  void initState(){
    super.initState();
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 800),
      );
      
      _curve = CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      );

      _colorAnimation = ColorTween(
        begin: Colors.grey[400],
        end: Colors.red[400],
      ).animate(_curve);
      
      _sizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50, end: 100),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 100, end: 50),
            weight: 50,
          ),
        ],
      ).animate(_curve);
    
      _controller.forward();

      
      
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return IconButton(
          icon: Icon(Icons.favorite),
          color: _colorAnimation.value,
          onPressed: () {
            if(_controller.isCompleted){
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        );
      },
      
    
        // onPressed: () {},
    );

  }
}
