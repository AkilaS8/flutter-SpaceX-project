import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';

abstract class NextRepository{
  Future<Either<Failure, NextLaunchDataModelEntity>> getNextData();
}