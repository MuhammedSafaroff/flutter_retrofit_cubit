import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_cubit_app/presentation/pages/home/home_page.dart';
import 'package:flutter_retrofit_cubit_app/presentation/pages/kanza/hanzo_kanzo.dart';
import 'package:flutter_retrofit_cubit_app/presentation/pages/kanza/kanza_page.dart';
import 'package:kanza/kanza.dart';

import 'cubit/cubit/post_cubit.dart';
import 'data/repositories/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Retrofit',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: BlocProvider(
          create: (context) => PostCubit(Repository())..fetchPosts(),
          child: KanzaProvider(
            builder: (context) => Hanzo(),
            child: HanzoPage(),
          ),
        ));
  }
}
