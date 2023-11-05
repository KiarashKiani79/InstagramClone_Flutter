class UserModel {
  final String uid;
  final String username;
  final String email;
  final String? bio;
  final String? photoUrl;
  final List<String>? followers;
  final List<String>? following;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    this.photoUrl,
    this.following,
    this.followers,
    this.bio,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'username': username,
      'email': email,
      'bio': bio,
      'photoUrl': photoUrl,
      'followers': followers,
      'following': following,
    };
  }
}
