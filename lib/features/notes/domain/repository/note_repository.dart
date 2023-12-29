import 'package:clean_architecture_notes_app/core/errors/failure.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NoteRepository {
  Future<AddNoteEntity> addNote(AddNoteEntity addNoteEntity);
  Future<Either<Failure, AddNoteEntity>> editNote(AddNoteEntity addNoteEntity);
  Future<void> deleteNote(String id);
  Future<Either<Failure, List<AddNoteEntity>>> getAllNotes();
}
