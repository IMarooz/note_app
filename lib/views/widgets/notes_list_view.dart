import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_tharwat/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_tharwat/models/note_model.dart';
import 'package:note_app_tharwat/views/edit_note_view.dart';
import 'package:note_app_tharwat/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditNoteView()),
        );
      },
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.builder(
              itemCount: notes.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: NoteItem(note: notes[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
