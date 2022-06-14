import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';

abstract class DragonsRepository {
  Future<Either<Failure, List<DragonDataEntity>>> getDragonsData();
}
