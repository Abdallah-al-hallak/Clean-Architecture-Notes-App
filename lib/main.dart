import 'package:clean_architecture_notes_app/dependencies.dart';
import 'package:clean_architecture_notes_app/features/notes/data/data_source/local/db/app_database.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/pages/notes_list/notes_list_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<IsarSingleton>().isarInit;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const NotesListView(),
    );
  }
}
