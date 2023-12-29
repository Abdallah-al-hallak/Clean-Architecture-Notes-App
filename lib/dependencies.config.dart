// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/notes/data/data_source/local/db/app_database.dart' as _i3;
import 'features/notes/data/data_source/local/note_service_db.dart' as _i4;
import 'features/notes/data/repository/note_repository_imp.dart' as _i6;
import 'features/notes/domain/repository/note_repository.dart' as _i5;
import 'features/notes/domain/usecases/addnote_usecase.dart' as _i7;
import 'features/notes/domain/usecases/edit_note_usecase.dart' as _i8;
import 'features/notes/domain/usecases/getnotes_usecase.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IsarSingleton>(() => _i3.IsarSingleton());
  gh.factory<_i4.NoteServiceDB>(
      () => _i4.NoteServiceDbImp(gh<_i3.IsarSingleton>()));
  gh.factory<_i5.NoteRepository>(
      () => _i6.NoteRepositoryImp(noteServiceDb: gh<_i4.NoteServiceDB>()));
  gh.factory<_i7.AddNoteUseCase>(
      () => _i7.AddNoteUseCase(gh<_i5.NoteRepository>()));
  gh.factory<_i8.EditNoteUseCase>(
      () => _i8.EditNoteUseCase(noteRepository: gh<_i5.NoteRepository>()));
  gh.factory<_i9.GetNotesUseCase>(
      () => _i9.GetNotesUseCase(gh<_i5.NoteRepository>()));
  return getIt;
}
