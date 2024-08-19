import 'dart:convert';
import 'dart:developer';
import 'package:learning_bloc/features/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    final client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      final response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      // Decode the JSON string into a List of dynamic
      List<dynamic> jsonList = jsonDecode(response.body);

      // Create a list to store PostDataUiModel instances
      List<PostDataUiModel> posts = [];

      for (var i = 0; i < jsonList.length; ++i) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(jsonList[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPosts() async {
    final client = http.Client();

    try {
      final response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {"title": "try", "body": "testing", "userId": "55"});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
