import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/add_note_entity.dart';
import '../bloc/notes_bloc/bloc/notes_bloc.dart';
import '../pages/add_note/add_note_page.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key, required this.note});
  final AddNoteEntity note;
  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NoteContent(note: widget.note),
        Positioned(
            right: 10,
            child: EditIconWidget(
              note: widget.note,
            )),
      ],
    );
  }
}

class NoteContent extends StatelessWidget {
  const NoteContent({super.key, required this.note});
  final AddNoteEntity note;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      height: 75,
      duration: const Duration(milliseconds: 350),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(note.color)),
      child: Column(
        children: [
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(note.title))),
          Expanded(child: Text(note.body)),
        ],
      ),
    );
  }
}

class EditIconWidget extends StatelessWidget {
  const EditIconWidget({super.key, required this.note});
  final AddNoteEntity note;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashRadius: 10,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<NotesBloc>(),
                  child: AddNotePage(note: note),
                ),
              ));
        },
        icon: const Icon(Icons.edit_note));
  }
}
