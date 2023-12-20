// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json
    .decode(str)
    .map((x) => Post.fromJson(x))
    .where((post) => post.title != null));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

// class PostResult {
//   PostResult({required this.posts});

//   // final String status;
//   final List<Post> posts;

//   factory PostResult.fromJson(Map<String, dynamic> json) => PostResult(posts: List<Post>.from(json[]))
// }
