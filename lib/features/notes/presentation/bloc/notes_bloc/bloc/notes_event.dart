part of 'notes_bloc.dart';

sealed class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

final class GetNotesEvent extends NotesEvent {
  const GetNotesEvent();
}

final class AddNoteEvent extends NotesEvent {
  const AddNoteEvent(this.addNoteEntity);
  final AddNoteEntity addNoteEntity;
}

final class EditNoteEvent extends NotesEvent {
  const EditNoteEvent(this.addNoteEntity);

  final AddNoteEntity addNoteEntity;
}

final class DeleteNoteEvent extends NotesEvent {
  const DeleteNoteEvent(this.id);
  final int id;
}
