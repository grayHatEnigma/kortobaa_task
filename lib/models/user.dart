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
    email = doc['email'];
    imageUrl = doc['imageUrl'];
    deviceToken = doc['deviceToken'];
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'deviceToken': deviceToken
    };
  }
}
