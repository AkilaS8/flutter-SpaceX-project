import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';
import 'package:space_x/features/feature_next_lunch/domain/repositories/next_repository.dart';

class GetNextUseCase extends UseCase<NextLaunchDataModelEntity, NoParams>{
  final NextRepository repository;

  GetNextUseCase(this.repository);

  @override
  Future<Either<Failure, NextLaunchDataModelEntity>> call(NoParams params) {
    return repository.getNextData();
  }

}