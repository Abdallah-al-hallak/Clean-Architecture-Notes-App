import 'package:clean_architecture_notes_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call({Params? params});
}

abstract class UseCaseEither<Type, Params> {
  Future<Either<Failure, Type>> call({Params? params});
}
