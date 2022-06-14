import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_launches_past/domain/entities/response/past_data_entity.dart';
import 'package:space_x/features/feature_launches_past/domain/repositories/past_repositories.dart';

class GetPastUseCase extends UseCase<List<PastDataModelEntity>, NoParams>{
  final PastRepository repository;

  GetPastUseCase(this.repository);

  @override
  Future<Either<Failure, List<PastDataModelEntity>>> call(NoParams params) {
    return repository.getPastData();
  }

}