import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_history/data/data_sources/history_remote_data_source.dart';
import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';
import 'package:space_x/features/feature_history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository{

  final NetworkInfo networkInfo;
  final HistoryRemoteDataSource remoteDataSource;

    HistoryRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<HistoryDataModelEntity>>> getHistoryData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getHistoryDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}