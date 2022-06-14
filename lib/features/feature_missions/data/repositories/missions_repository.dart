import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_missions/data/data_source/remote_data_source/missions_remote_data_data_source.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';
import 'package:space_x/features/feature_missions/domain/repositories/missions_repository.dart';

class MissionsRepositoryImpl implements MissionsRepository {
  final NetworkInfo networkInfo;
  final MissionsRemoteDataSource remoteDataSource;

  MissionsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<MissionsDataModelEntity>>>
      getMissionsData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getMissionsDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
