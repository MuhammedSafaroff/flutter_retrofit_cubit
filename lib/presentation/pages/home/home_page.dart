import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_cubit_app/cubit/cubit/post_cubit.dart';
import 'package:flutter_retrofit_cubit_app/data/model/post.dart';
import 'package:flutter_retrofit_cubit_app/presentation/pages/post_details/post_details.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrofit'),
      ),
      body: Container(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              List<Post> data = state.data!;
              return ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostDetails(id: data[index].id))),
                    leading: Text(data[index].id.toString()),
                    title: Text(data[index].title!),
                  ),
                ),
                itemCount: data.length,
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
