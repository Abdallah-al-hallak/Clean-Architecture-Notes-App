import 'package:clean_architecture_notes_app/core/errors/failure.dart';
import 'package:clean_architecture_notes_app/core/usecase/usecase.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/repository/note_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetNotesUseCase implements UseCaseEither<List<AddNoteEntity>, void> {
  final NoteRepository noteRepository;
  GetNotesUseCase(this.noteRepository);

  @override
  Future<Either<Failure, List<AddNoteEntity>>> call({void params}) async {
    return noteRepository.getAllNotes();
  }
}
