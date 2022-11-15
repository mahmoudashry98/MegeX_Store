import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<dynamic, T>> call(Parameters parameters);
}

class NoParemeters extends Equatable {
  const NoParemeters();
  @override
  List<Object?> get props => [];
}
