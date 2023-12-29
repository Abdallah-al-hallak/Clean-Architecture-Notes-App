import 'package:clean_architecture_notes_app/features/notes/presentation/bloc/notes_bloc/bloc/notes_bloc.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/pages/add_note/add_note_page.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/widgets/notes_list_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/notes_filter_widget.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotesListCompleteView();
  }
}

class NotesListCompleteView extends StatelessWidget {
  const NotesListCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'gg',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<NotesBloc>(),
                  child: const AddNotePage(),
                ),
              ));
        },
      ),
      body: const Column(
        children: [
          NotesFilterWidget(),
          NotesList(),
        ],
      ),
    );
  }
}
