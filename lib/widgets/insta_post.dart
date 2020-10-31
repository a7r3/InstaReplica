import 'package:flutter/material.dart';
import 'insta_like.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instareplica/model/Post.dart';

class InstaPost extends StatefulWidget {
  Post post;
  bool isLiked = false;

  InstaPost({@required this.post, @required this.isLiked});
  @override
  _InstaPostState createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {



  void _handleLikedByDoubleTap() {
    setState(() {
      if (!widget.isLiked) {
        widget.isLiked = true;
        widget.post.likeCount++;
      }
    });
  }

  void _handleLikedByButton() {
    setState(() {
      if (widget.isLiked)
        widget.post.likeCount--;
      else
        widget.post.likeCount++;
      widget.isLiked = !widget.isLiked;
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
                              child: Text(widget.post.user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Visibility(
                              child: ImageIcon(AssetImage("images/verified.png"), color: Colors.blue, size: 16.0,),
                              visible: widget.post.user.isVerified,
                            )
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
                    image: AssetImage(widget.post.imageUrl),
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
                          widget.isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                          color: widget.isLiked ? Colors.red : Colors.black,),
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
                child: Text("${widget.post.likeCount} likes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                child: Row(
                  children: [
                    Text(widget.post.user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text(widget.post.caption),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 6.0),
                child: Text("View all ${widget.post.commentCount} comments", style: TextStyle(color: Colors.grey[700]),),
              )
            ],
          )
      ),
    );
  }
}
