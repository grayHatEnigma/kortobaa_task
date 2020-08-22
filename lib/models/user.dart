class User {
  String userId;
  String deviceToken;
  String name;
  String email;
  String imageUrl;
  User({
    this.userId,
    this.deviceToken,
    this.name,
    this.email,
    this.imageUrl,
  });

  User.fromDocument(Map<String, dynamic> doc) {
    name = doc['name'];
    userId = doc['userId'];
    email = doc['email'];
    imageUrl = doc['imageUrl'];
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'userId': userId,
      'email': email,
      'imageUrl': imageUrl
    };
  }
}
