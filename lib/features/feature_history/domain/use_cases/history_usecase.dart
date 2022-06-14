import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';
import 'package:space_x/features/feature_history/domain/repositories/history_repository.dart';

class GetHistoryUseCase extends UseCase<List<HistoryDataModelEntity>, NoParams> {
  final HistoryRepository repository;

  GetHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<HistoryDataModelEntity>>> call(NoParams params) async {
    return repository.getHistoryData();
  }



}