import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_cubit_app/cubit/cubit/post_cubit.dart';
import 'package:flutter_retrofit_cubit_app/data/model/post.dart';
import 'package:flutter_retrofit_cubit_app/data/repositories/repository.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    Key? key,
    this.id,
  }) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(Repository())..selectedPost(id!),
      child: Scaffold(
        appBar: AppBar(title: Text('Post Details')),
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              List<Post> data = state.data!;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[0].id.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    const SizedBox(height: 14),
                    Text(data[0].title!,
                        style: TextStyle(fontSize: 16, color: Colors.blue)),
                    const SizedBox(height: 14),
                    Text(data[0].body!,
                        style: TextStyle(fontSize: 14, color: Colors.red)),
                    const SizedBox(height: 14),
                  ],
                ),
              );
            } else if (state is PostError) {
              return Center(
                child: Text(state.message!),
              );
            } else {
              return Center(
                child: Text('xeta'),
              );
            }
          },
        ),
      ),
    );
  }
}
