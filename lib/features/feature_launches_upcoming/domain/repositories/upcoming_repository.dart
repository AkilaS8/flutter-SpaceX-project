import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';

abstract class UpcomingRepository{
  Future<Either<Failure, List<UpcomingDataModelEntity>>> getUpcomingData();
}