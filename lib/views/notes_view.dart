import 'package:flutter/material.dart';
import 'package:note_app_tharwat/views/widgets/notes_view_body.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotesViewBody());
  }
}

