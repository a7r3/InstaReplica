import 'package:flutter/material.dart';
import 'widgets/insta_like.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaReplica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InstaPost()
    );
  }
}

class InstaPost extends StatefulWidget {
  @override
  _InstaPostState createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {

  bool _isLiked = false;
  int _likeCount = 419;

  void _handleLikedByDoubleTap() {
    setState(() {
      if (!_isLiked) {
        _isLiked = true;
        _likeCount++;
      }
    });
  }

  void _handleLikedByButton() {
    setState(() {
      if (_isLiked)
        _likeCount--;
      else
        _likeCount++;
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text('Posts', style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white,
                elevation: 2.0,
                leading: IconButton(
                  icon: ImageIcon(AssetImage('images/back.png'), color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12.0, top: 8.0, right: 8.0, bottom: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/me.jpg"),
                            radius: 16.0,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text("n00blife", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ImageIcon(AssetImage("images/verified.png"), color: Colors.blue, size: 16.0,)
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.black, size: 16.0,),
                    ),
                  ],
                ),
              ),
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Image(
                    image: AssetImage('images/spidey.png'),
                  ),
                  InstaLikeWidget(_handleLikedByDoubleTap),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: FaIcon(
                          _isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                          color: _isLiked ? Colors.red : Colors.black,),
                        onPressed: _handleLikedByButton,
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.comment, color: Colors.black),
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.paperPlane, color: Colors.black),
                      )
                    ],
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.bookmark, color: Colors.black,),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 2.0),
                child: Text("$_likeCount likes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                child: Row(
                  children: [
                    Text("n00blife", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text("Now it's your turn. Go be a hero, Miles."),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 6.0),
                child: Text("View all 69 comments", style: TextStyle(color: Colors.grey[700]),),
              )
            ],
          )
        ),
    );
  }
}

