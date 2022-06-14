import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';
import 'package:space_x/features/feature_missions/domain/repositories/missions_repository.dart';

class GetMissionsUseCase extends UseCase<List<MissionsDataModelEntity>, NoParams> {
  final MissionsRepository repository;

  GetMissionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MissionsDataModelEntity>>> call(NoParams params) {
    return repository.getMissionsData();
  }
  
}