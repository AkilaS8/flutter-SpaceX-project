import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';

abstract class ShipsRepository {
  Future<Either<Failure, List<ShipDataModelEntity>>> getShipsData(); //pass entity
}