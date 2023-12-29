import 'package:clean_architecture_notes_app/features/notes/domain/usecases/edit_note_usecase.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/usecases/getnotes_usecase.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/bloc/notes_bloc/bloc/notes_bloc.dart';
import 'package:clean_architecture_notes_app/features/notes/presentation/pages/notes_list/notes_list_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../dependencies.dart';
import '../../../domain/usecases/addnote_usecase.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(getIt<AddNoteUseCase>(),
          getIt<GetNotesUseCase>(), getIt<EditNoteUseCase>())
        ..add(const GetNotesEvent()),
      child: const NotesListPage(),
    );
  }
}
