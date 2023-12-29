import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

class AddNoteEntity extends Equatable {
  final Id? id;
  final String title;
  final String body;
  final DateTime date;
  final int color;
  const AddNoteEntity({
    required this.title,
    required this.date,
    this.id,
    required this.body,
    required this.color,
  });
  @override
  @ignore
  List<Object?> get props => [id, title, body, color, date];
}
