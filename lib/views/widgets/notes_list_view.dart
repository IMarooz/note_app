import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: NoteItem(),
            );
          },
        ),
      ),
    );
  }
}
