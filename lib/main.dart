import 'package:flutter/material.dart';
import 'model/Post.dart';
import 'model/User.dart';
import 'widgets/insta_post.dart';

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
      home: InstaPost(
        post: Post(
          caption: "Now it's your turn. Go be a hero Miles!",
          commentCount: 69,
          likeCount: 419,
          imageUrl: 'images/spidey.png',
          user: User(
            "226ndnf8fu4895ia7r3th6475mghv7f63gdjc8",
            "n00blife",
            true
          )
        ),
        isLiked: false,
      )
    );
  }
}
