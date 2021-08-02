import 'package:flutter/material.dart';
import 'package:flutter_retrofit_cubit_app/presentation/pages/kanza/hanzo_kanzo.dart';
import 'package:kanza/kanza.dart';

class HanzoPage extends StatelessWidget {
  const HanzoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hanzo = KanzaProvider.of<Hanzo>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: KanzaBuilder<Hanzo, int>(
            builder: (context, state) {
              print(state);
              return Text('$state');
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hanzo.artir();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
