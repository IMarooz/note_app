import 'package:flutter/material.dart';
import 'package:note_app_tharwat/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                note.subTitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16,
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, size: 24),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              note.date,
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ],
      ),
    );
  }
}
