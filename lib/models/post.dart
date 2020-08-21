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

  Post.fromDocument(Map<String, dynamic> doc) {
    userName = doc['userName'];
    userId = doc['userId'];
    body = doc['body'];
    timestamp = doc['timestamp'];
    imageUrl = doc['imageUrl'];
  }
}
