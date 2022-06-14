import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_launches_past/domain/entities/response/past_data_entity.dart';

abstract class PastRepository{
  Future<Either<Failure, List<PastDataModelEntity>>> getPastData();//pass entity
}