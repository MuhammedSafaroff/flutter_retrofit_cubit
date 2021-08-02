import 'package:kanza/kanza.dart';

class Hanzo extends Kanza<int> {
  Hanzo() : super(0);

  void artir() {
    
  }

  void azalt() {
    notify(--state);
  }
}
