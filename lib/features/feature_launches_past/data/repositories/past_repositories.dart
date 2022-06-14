import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_launches_past/data/data_sources/past_remote_data_source.dart';
import 'package:space_x/features/feature_launches_past/domain/entities/response/past_data_entity.dart';
import 'package:space_x/features/feature_launches_past/domain/repositories/past_repositories.dart';

class PastRepositoryImpl implements PastRepository{
  final NetworkInfo networkInfo;
  final PastRemoteDataSource remoteDataSource;

  PastRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<PastDataModelEntity>>> getPastData() async{
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getPastDetails());
    } on ServerException {
    return Left(ServerFailure());
    }
    } else {
    return Left(ServerFailure());
    }
  }

}