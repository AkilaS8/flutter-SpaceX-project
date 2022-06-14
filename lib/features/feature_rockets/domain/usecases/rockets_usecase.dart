import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';
import 'package:space_x/features/feature_rockets/domain/repositories/rockets_repository.dart';

class GetRocketsUseCase extends UseCase<List<RocketDataEntity>, NoParams> {
  final RocketsRepository repository;

  GetRocketsUseCase(this.repository);

  @override
  Future<Either<Failure, List<RocketDataEntity>>> call(NoParams params) async {
    return await repository.getRocketsData();
  }
}
