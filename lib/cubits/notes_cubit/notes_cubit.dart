import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app_tharwat/constants.dart';
import 'package:note_app_tharwat/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    fetchAllNotes();
  }

  List<NoteModel>? notes;

  fetchAllNotes() async {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
