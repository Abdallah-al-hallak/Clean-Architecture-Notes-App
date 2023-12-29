import 'package:clean_architecture_notes_app/core/errors/failure.dart';
import 'package:clean_architecture_notes_app/features/notes/data/data_source/local/db/app_database.dart';
import 'package:clean_architecture_notes_app/features/notes/data/models/add_note_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class NoteServiceDB {
  Future<List<AddNoteModel>> getAllNotes();
  Future<AddNoteModel> addNote(AddNoteModel addNoteModel);
  Future<void> deleteNote(String id);
  Future<AddNoteModel> editNote(AddNoteModel addNoteModel);
}

@Injectable(as: NoteServiceDB)
class NoteServiceDbImp extends NoteServiceDB {
  final IsarSingleton isarSingleton;
  NoteServiceDbImp(this.isarSingleton);

  @override
  Future<AddNoteModel> addNote(AddNoteModel addNoteModel) async {
    try {
      await isarSingleton.isar.writeTxn(() async {
        int id = await isarSingleton.isar.addNoteModels.put(addNoteModel);

        print(id);
      });
      return addNoteModel;
    } on IsarError catch (e) {
      throw DataBaseFailure(e.message);
    }
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<AddNoteModel> editNote(AddNoteModel addNoteModel) {
    // TODO: implement editNote
    throw UnimplementedError();
  }

  @override
  Future<List<AddNoteModel>> getAllNotes() {
    Query<AddNoteModel> notes = isarSingleton.isar.addNoteModels
        .buildQuery(sortBy: [SortProperty(property: 'date', sort: Sort.desc)]);
    final response = notes.findAll();
    return response;
  }
}
