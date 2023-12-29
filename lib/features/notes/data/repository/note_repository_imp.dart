import 'package:clean_architecture_notes_app/features/notes/data/models/add_note_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:clean_architecture_notes_app/core/errors/failure.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/repository/note_repository.dart';

import '../data_source/local/note_service_db.dart';

@Injectable(as: NoteRepository)
class NoteRepositoryImp extends NoteRepository {
  final NoteServiceDB noteServiceDb;
  NoteRepositoryImp({
    required this.noteServiceDb,
  });
  @override
  Future<AddNoteEntity> addNote(AddNoteEntity addNoteEntity) {
    return noteServiceDb.addNote(AddNoteModel.fromEntity(addNoteEntity));
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AddNoteEntity>>> getAllNotes() async {
    try {
      final response = await noteServiceDb.getAllNotes();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddNoteEntity>> editNote(
      AddNoteEntity addNoteEntity) async {
    try {
      AddNoteModel addNoteModel =
          await noteServiceDb.editNote(AddNoteModel.fromEntity(addNoteEntity));
      return Right(addNoteModel);
    } catch (e) {
      return Left(DataBaseFailure(e.toString()));
    }
  }
}
