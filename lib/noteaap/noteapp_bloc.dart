import 'package:bloc_state_managemnet/noteaap/noteapp_event.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_state.dart';
import 'package:bloc_state_managemnet/noteaap/notemodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteappBloc extends Bloc<NoteappEvent, NoteappState> {
  NoteappBloc() : super(NoteappState(note: [])) {
    /// add note //
    on<Addnote>((event, emit) {
      final updatenotes = List<Notemodel>.from(state.note);
      updatenotes.insert(
        0,
        Notemodel(description: event.description, id: "", title: event.title),
      );
      emit(NoteappState(note: updatenotes));
    });

    /// deelet //
    ///
    on<Deletnote>((event, emit) {
      final updated = state.note.where((note) => note.id != event.id).toList();
      emit(NoteappState(note: updated));
    });

    ///update//
    on<Updatenote>((event, emit) {
      final updatedList = state.note.map((note) {
        if (note.id == event.id) {
          return Notemodel(
            id: note.id,
            title: event.title,
            description: event.description,
          );
        }
        return note;
      }).toList();

      emit(NoteappState(note: updatedList));
    });
  }
}
