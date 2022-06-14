import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryDataModelEntity>>> getHistoryData(); //passed the entity we made earlier
}
