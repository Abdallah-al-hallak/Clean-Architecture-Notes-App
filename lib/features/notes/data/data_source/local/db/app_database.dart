import 'package:clean_architecture_notes_app/features/notes/data/models/add_note_model.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

@Injectable()
class IsarSingleton {
  static Isar? _isarInstance;
  static final IsarSingleton _singleton = IsarSingleton._internal();

  factory IsarSingleton() {
    return _singleton;
  }

  IsarSingleton._internal();
  Isar get isar => _isarInstance!;
  Future<Isar> get isarInit async {
    if (_isarInstance == null) {
      await _initializeIsar();
    }
    return _isarInstance!;
  }

  Future<void> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isarInstance = await Isar.open([AddNoteModelSchema], directory: dir.path);
  }
}
