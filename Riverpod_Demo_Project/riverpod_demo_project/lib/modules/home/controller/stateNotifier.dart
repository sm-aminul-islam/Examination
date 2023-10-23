import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountNotifier extends StateNotifier<int> {
  CountNotifier(int state) : super(state);
  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}
