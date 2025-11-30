import 'package:flutter/material.dart';
import 'package:note_app_tharwat/views/widgets/custom_app_bar.dart';
import 'package:note_app_tharwat/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 12),
          CustomAppBar(title: 'Edit Note', icon: Icons.done),
          SizedBox(height: 24),
          CustomTextField(hint: "Title"),
          SizedBox(height: 16),
          CustomTextField(hint: "Content", maxLines: 5),
        ],
      ),
    );
  }
}