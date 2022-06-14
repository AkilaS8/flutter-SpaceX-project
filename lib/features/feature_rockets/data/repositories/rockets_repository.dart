import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_rockets/data/data_sources/remote_data_source/rockets_remote_data_source.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';
import 'package:space_x/features/feature_rockets/domain/repositories/rockets_repository.dart';

class RocketsRepositoryImpl implements RocketsRepository {
  final NetworkInfo networkInfo;
  final RocketRemoteDataSource remoteDataSource;

  RocketsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<RocketDataEntity>>> getRocketsData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getRocketsDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
