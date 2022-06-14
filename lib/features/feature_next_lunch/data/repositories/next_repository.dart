import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_next_lunch/data/data_sources/remote_data_sources/next_remote_data_source.dart';
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';
import 'package:space_x/features/feature_next_lunch/domain/repositories/next_repository.dart';

class NextRepositoryImpl implements NextRepository{
  final NetworkInfo networkInfo;
  final NextRemoteDataSource remoteDataSource;

  NextRepositoryImpl({
    required this.remoteDataSource, required this.networkInfo
  });

  @override
  Future<Either<Failure, NextLaunchDataModelEntity>> getNextData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getNextDetails());
    } on ServerException {
    return Left(ServerFailure());
    }
    } else {
    return Left(ServerFailure());
    }

  }

}