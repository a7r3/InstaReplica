import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaLikeWidget extends StatefulWidget {

  InstaLikeWidget(this.likedCallback);

  final VoidCallback likedCallback;

  @override
  _InstaLikeWidgetState createState() => _InstaLikeWidgetState(likedCallback);
}

class _InstaLikeWidgetState extends State<InstaLikeWidget> with SingleTickerProviderStateMixin {

  _InstaLikeWidgetState(this.likedCallback);

  AnimationController _controller;
  Animation<double> _animation, _opacityTween;
  final VoidCallback likedCallback;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
    _opacityTween = Tween<double>(begin: 0.0, end: 0.7).animate(_animation);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Future.delayed(Duration(milliseconds: 250), () {
          _controller.reverse();
        });
    });
  }

  void _startAnimation() {
    _controller.forward();
    likedCallback.call();
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap'),));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: _startAnimation,
        child: Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: _opacityTween,
            child: ScaleTransition(
              scale: _animation,
              child: Opacity(
                opacity: 0.7,
                child: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.white,
                  size: 96.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
