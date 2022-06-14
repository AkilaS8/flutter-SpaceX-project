import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_dragon/data/data_sources/remote_data_source/dragons_remote_data_source.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';
import 'package:space_x/features/feature_dragon/domain/repositories/dragon_repository.dart';

class DragonsRepositoryImpl implements DragonsRepository {
  final NetworkInfo networkInfo;
  final DragonRemoteDataSource remoteDataSource;

  DragonsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<DragonDataEntity>>> getDragonsData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getDragonsDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
