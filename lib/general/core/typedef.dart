import 'package:dartz/dartz.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';

typedef FutureResult<T> = Future<Either<MainFailure, T>>;

typedef StreamResult<T> = Stream<Either<MainFailure, T>>;
