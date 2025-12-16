import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_tharwat/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app_tharwat/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_tharwat/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            // refresh notes list after a successful add
            try {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            } catch (_) {}
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: const AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
