import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_ships/data/data_source/remote_data_source/ships_remote_data_data_source.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';
import 'package:space_x/features/feature_ships/domain/repositories/ships_repository.dart';

class ShipsRepositoryImpl implements ShipsRepository {
  final NetworkInfo networkInfo;
  final ShipsRemoteDataSource remoteDataSource;

  ShipsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ShipDataModelEntity>>> getShipsData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getShipsDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
