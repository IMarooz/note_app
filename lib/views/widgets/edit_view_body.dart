import 'package:flutter/material.dart';
import 'package:note_app_tharwat/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          CustomAppBar(title: 'Edit Note', icon: Icons.done),
        ],
      ),
    );
  }
}