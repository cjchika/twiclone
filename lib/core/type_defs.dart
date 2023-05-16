import 'package:fpdart/fpdart.dart';
import 'package:twiclone/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;