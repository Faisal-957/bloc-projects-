import 'package:bloc_state_managemnet/counterapp/event.dart';
import 'package:bloc_state_managemnet/counterapp/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counterbloc extends Bloc<CounterEvent, CounterState> {
  Counterbloc() : super(CounterState(0)) {
    on<Plus>((event, emit) {
      emit(CounterState(state.counterValue + 1));
    });
    on<Minus>((event, emit) {
      emit(CounterState(state.counterValue - 1));
    });
  }
}
