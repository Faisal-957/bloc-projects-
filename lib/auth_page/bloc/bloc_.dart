import 'package:bloc_state_managemnet/auth_page/auth_service.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/event.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authbloc extends Bloc<Authevent, AuthState> {
  final AuthService authService;
  Authbloc(this.authService) : super(AuthInitial()) {
    on<Loginevent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authService.login(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure("Invalid email or password"));
      }
    });

    on<Signupevent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authService.signup(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure("Something went wrong"));
      }
    });
  }
}
