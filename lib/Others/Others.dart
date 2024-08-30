import 'package:flutter/material.dart';

class LikeEffect extends StatefulWidget {
  @override
  _LikeEffectState createState() => _LikeEffectState();
}

class _LikeEffectState extends State<LikeEffect> with SingleTickerProviderStateMixin {
  bool _isLiked = false; // To track the like status
  double _likeOpacity = 0.0; // Initial opacity of the like icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Double Tap to Like'),
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              _isLiked = !_isLiked;
              _likeOpacity = 1.0;

              // Fade out the like icon after 500ms
              Future.delayed(Duration(milliseconds: 500), () {
                setState(() {
                  _likeOpacity = 0.0;
                });
              });
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Your main content goes here (e.g., an image)
              Container(
                height: 300,
                width: 300,
                color: Colors.grey[300],
                child: Center(child: Text('Double Tap Me!')),
              ),

              // The like icon that will be animated
              AnimatedOpacity(
                opacity: _likeOpacity,
                duration: Duration(milliseconds: 200),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


