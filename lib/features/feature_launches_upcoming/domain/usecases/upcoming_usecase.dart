import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/repositories/upcoming_repository.dart';

class GetUpcomingUseCase extends UseCase<List<UpcomingDataModelEntity>, NoParams>{
  final UpcomingRepository repository;

  GetUpcomingUseCase(this.repository);

  @override
  Future<Either<Failure, List<UpcomingDataModelEntity>>> call(NoParams params) async{
    return await repository.getUpcomingData();
  }

}