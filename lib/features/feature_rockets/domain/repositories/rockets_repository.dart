import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';

abstract class RocketsRepository {
  Future<Either<Failure, List<RocketDataEntity>>> getRocketsData();
}