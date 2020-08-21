class Post {
  String postId;
  String userId;
  String userName;
  String imageUrl;
  String body;
  DateTime timestamp;

  Post({
    this.userId,
    this.userName,
    this.postId,
    this.imageUrl,
    this.body,
    this.timestamp,
  });
}
