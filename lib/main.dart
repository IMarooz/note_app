import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_tharwat/constants.dart';
import 'package:note_app_tharwat/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app_tharwat/models/note_model.dart';
import 'package:note_app_tharwat/simple_bloc_observer.dart';
import 'package:note_app_tharwat/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddNoteCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        home: NotesView(),
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[900],
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
