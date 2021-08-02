import 'package:flutter_retrofit_cubit_app/data/model/post.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_data_provider.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<Post>> getPost();

  @GET("/posts/{id}")
  Future<Post> getPostSelected(@Path('id') int id);
}
