import 'package:flutter_retrofit_cubit_app/data/data_provider/post_data_provider.dart';
import 'package:flutter_retrofit_cubit_app/data/model/post.dart';
import 'package:dio/dio.dart';

class Repository {
  Future<List<Post>?> fetchPosts() async {
    RestClient client = RestClient(Dio());
    try {
      List<Post> data = await client.getPost();
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<Post?> selectedPost(int id) async {
    RestClient client = RestClient(Dio());
    try {
      Post data = await client.getPostSelected(id);
      return data;
    } catch (e) {
      return Post();
    }
  }
}
