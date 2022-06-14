import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';
import 'package:space_x/features/feature_dragon/domain/repositories/dragon_repository.dart';

class GetDragonsUseCase extends UseCase<List<DragonDataEntity>, NoParams> {
  final DragonsRepository repository;

  GetDragonsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DragonDataEntity>>> call(NoParams params) async {
    return repository.getDragonsData();
  }
}
