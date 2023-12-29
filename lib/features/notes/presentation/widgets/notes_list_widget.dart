import 'package:clean_architecture_notes_app/features/notes/presentation/bloc/notes_bloc/bloc/notes_bloc.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/widgets/notes_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state.noteStatus == NoteStatus.added) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: state.notesList?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 0.0, height: 20.0);
            },
            itemBuilder: (BuildContext context, int index) {
              if (state.notesStatus == NotesStatus.loaded) {
                return NotesCard(
                  note: state.notesList![index],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
