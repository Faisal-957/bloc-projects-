import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dbnoteapp_event.dart';
part 'dbnoteapp_state.dart';

class DbnoteappBloc extends Bloc<DbnoteappEvent, DbnoteappState> {
  DbnoteappBloc() : super(DbnoteappInitial()) {
    on<DbnoteappEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
