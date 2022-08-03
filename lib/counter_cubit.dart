import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(0);
  }

  void divide() {
    emit(state ~/ 2);
  }

  void multiply() {
    emit(state * 2);
  }
}
