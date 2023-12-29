part of 'notes_bloc.dart';

enum NotesStatus {
  loading,
  loaded,
  failed,
}

enum NoteStatus {
  adding,
  added,
  failed,
}

class NotesState extends Equatable {
  final List<AddNoteEntity>? notesList;
  final AddNoteEntity? addNoteEntity;
  final NotesStatus? notesStatus;
  final NoteStatus? noteStatus;
  const NotesState({
    this.notesList,
    this.addNoteEntity,
    this.notesStatus,
    this.noteStatus,
  });
  @override
  List<Object?> get props =>
      [notesList, notesStatus, addNoteEntity, noteStatus];

  NotesState copyWith({
    List<AddNoteEntity>? notesList,
    NoteStatus? noteStatus,
    AddNoteEntity? addNoteEntity,
    NotesStatus? notesStatus,
  }) {
    return NotesState(
      notesList: notesList ?? this.notesList,
      noteStatus: noteStatus ?? this.noteStatus,
      addNoteEntity: addNoteEntity ?? this.addNoteEntity,
      notesStatus: notesStatus ?? this.notesStatus,
    );
  }
}
