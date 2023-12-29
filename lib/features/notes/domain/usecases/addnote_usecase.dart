import 'package:clean_architecture_notes_app/core/usecase/usecase.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/repository/note_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class AddNoteUseCase implements UseCase<void, AddNoteEntity> {
  final NoteRepository noteRepository;
  AddNoteUseCase(this.noteRepository);
  @override
  Future<AddNoteEntity> call({AddNoteEntity? params}) async {
    return noteRepository.addNote(params!);
  }
}
