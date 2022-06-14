import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_launches_upcoming/data/data_sources/remote_data_sources/upcoming_remote_data_source.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/repositories/upcoming_repository.dart';

class UpcomingRepositoryImpl implements UpcomingRepository{
  final NetworkInfo networkInfo;
  final UpcomingRemoteDataSource remoteDataSource;

  UpcomingRepositoryImpl({
    required this.remoteDataSource, required this.networkInfo
});

  @override
  Future<Either<Failure, List<UpcomingDataModelEntity>>> getUpcomingData() async{
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getUpcomingDetails());
    } on ServerException {
    return Left(ServerFailure());
    }
    } else {
    return Left(ServerFailure());
    }
  }

}