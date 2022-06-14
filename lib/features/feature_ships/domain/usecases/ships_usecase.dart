import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';
import 'package:space_x/features/feature_ships/domain/repositories/ships_repository.dart';

class GetShipsUseCase extends UseCase<List<ShipDataModelEntity>, NoParams> {
  final ShipsRepository repository;

  GetShipsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ShipDataModelEntity>>> call(NoParams params) {
    return repository.getShipsData();
  }
}