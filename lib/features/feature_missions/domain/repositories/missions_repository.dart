import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';

abstract class MissionsRepository {
  Future<Either<Failure, List<MissionsDataModelEntity>>> getMissionsData(); //pass entity
}