import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Post {
  String postId;
  String userId;
  String userName;
  String imageUrl;
  String body;
  DateTime date;

  Post({
    this.userId,
    this.userName,
    this.postId,
    this.imageUrl,
    this.body,
    this.date,
  });

  Post.fromDocument(Map<String, dynamic> doc) {
    userName = doc['userName'];
    userId = doc['userId'];
    body = doc['body'];
    date = doc['timestamp'].toDate();
    imageUrl = doc['imageUrl'];
  }

  Map<String, dynamic> toDocument() {
    return {
      'userName': userName,
      'userId': userId,
      'body': body,
      'timestamp': Timestamp.fromDate(date),
      'imageUrl': imageUrl
    };
  }
}
