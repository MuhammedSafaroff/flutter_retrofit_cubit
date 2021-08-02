part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  List<Post>? data;
  PostLoaded({this.data});
}

class PostError extends PostState {
  String? message;
  PostError({this.message});
}
