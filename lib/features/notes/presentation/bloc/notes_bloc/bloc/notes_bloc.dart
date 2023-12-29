import 'package:bloc/bloc.dart';
import 'package:clean_architecture_notes_app/features/notes/data/models/add_note_model.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/usecases/addnote_usecase.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/usecases/getnotes_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/usecases/edit_note_usecase.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final AddNoteUseCase addNoteUseCase;
  final EditNoteUseCase editNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  NotesBloc(this.addNoteUseCase, this.getNotesUseCase, this.editNoteUseCase)
      : super(const NotesState()) {
    on<AddNoteEvent>(_addNote);
    on<EditNoteEvent>(_editNote);
    on<GetNotesEvent>(_getNotes);
  }
  Future<void> _addNote(AddNoteEvent event, Emitter<NotesState> emit) async {
    try {
      emit(state.copyWith(
          addNoteEntity: state.addNoteEntity, noteStatus: NoteStatus.adding));
      List<AddNoteEntity> notes = [...state.notesList ?? []];
      AddNoteEntity note =
          await addNoteUseCase.call(params: event.addNoteEntity);
      int index = notes.indexWhere((element) => element.id == note.id);

      if (index != -1) {
        // update

        notes[index] = note; // replace the old one with the updated one.
      } else {
        // add
        notes.insert(0, note);
      }

      emit(state.copyWith(
          addNoteEntity: event.addNoteEntity,
          notesList: notes,
          noteStatus: NoteStatus.added));
    } catch (e) {
      // Do Nothing.
    }
  }

  Future<void> _editNote(EditNoteEvent event, Emitter<NotesState> emit) async {
    try {
      emit(state.copyWith(
        addNoteEntity: state.addNoteEntity,
      ));
      final note = await editNoteUseCase.call(params: event.addNoteEntity);
      List<AddNoteEntity> notes = [...state.notesList ?? []];
      note.fold((left) => emit(state.copyWith(notesStatus: NotesStatus.failed)),
          (right) {
        int index = notes.indexWhere((element) => element.id == right.id);
        notes[index] = right; // replace the old one with the updated one.
        emit(state.copyWith(addNoteEntity: right, notesList: notes));
      });
      emit(
          state.copyWith(addNoteEntity: event.addNoteEntity, notesList: notes));
    } catch (e) {
      // Do Nothing.
    }
  }

  Future<void> _getNotes(GetNotesEvent event, Emitter<NotesState> emit) async {
    emit(state.copyWith(
      notesStatus: NotesStatus.loading,
    ));
    var notesList = await getNotesUseCase.call();
    notesList.bimap(
        (l) => emit(state.copyWith(
            addNoteEntity: state.addNoteEntity,
            notesStatus: NotesStatus.failed)),
        (right) => emit(state.copyWith(
              addNoteEntity: state.addNoteEntity,
              notesStatus: NotesStatus.loaded,
              notesList: right,
            )));
  }
}
