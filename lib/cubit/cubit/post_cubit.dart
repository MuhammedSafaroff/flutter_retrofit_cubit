import 'package:bloc/bloc.dart';
import 'package:flutter_retrofit_cubit_app/data/model/post.dart';
import 'package:flutter_retrofit_cubit_app/data/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.repository) : super(PostInitial());

  Repository? repository;

  void fetchPosts() async {
    emit(PostLoading());
    List<Post>? listPost = await repository!.fetchPosts();
    if (listPost!.isNotEmpty) {
      emit(PostLoaded(data: listPost));
    } else {
      emit(PostError(message: 'xeta bas verdi'));
    }
  }

  void selectedPost(int id) async {
    emit(PostLoading());
    Post? listPost = await repository!.selectedPost(id);
    if (listPost != null || listPost != Post()) {
      emit(PostLoaded(data: [listPost!]));
    } else {
      emit(PostError(message: 'xeta bas verdi'));
    }
  }
}
