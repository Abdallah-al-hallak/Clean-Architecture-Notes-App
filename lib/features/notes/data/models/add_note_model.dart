import 'package:isar/isar.dart';

import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';

part 'add_note_model.g.dart';

@Collection(ignore: {'props'})
class AddNoteModel extends AddNoteEntity {
  const AddNoteModel({
    final Id? id,
    required String title,
    required DateTime date,
    required String body,
    required int color,
  }) : super(body: body, color: color, title: title, id: id, date: date);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'body': body,
      'color': color, // Convert Color to its string representation
      'id': id,
      'date': date,
    };

    return data;
  }

  factory AddNoteModel.fromEntity(AddNoteEntity addNoteEntity) {
    return AddNoteModel(
        title: addNoteEntity.title,
        body: addNoteEntity.body,
        color: addNoteEntity.color,
        date: addNoteEntity.date,
        id: addNoteEntity.id);
  }
}
