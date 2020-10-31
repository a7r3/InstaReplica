import 'User.dart';

class Post {
  String caption;
  String imageUrl;
  int likeCount = 419;
  int commentCount = 69;
  User user;

  Post({this.caption, this.imageUrl, this.likeCount, this.commentCount,
      this.user});
}