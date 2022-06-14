import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';
import 'package:space_x/features/feature_ships/domain/usecases/ships_usecase.dart';

part 'ships_events.dart';

part 'ships_status.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ShipsBloc extends Bloc<ShipsEvent, ShipsState> {
  final GetShipsUseCase useCase;

  ShipsBloc({required this.useCase}) : super(ShipsInitialState());

  @override
  Stream<ShipsState> mapEventToState(ShipsEvent event) async* {
    if (event is GetShipsDataListEvent) {
      yield ShipsLoadingState();
      final failureOrShipData = await useCase(NoParams());
      yield failureOrShipData.fold(
        (failure) =>
            ShipsErrorState(errorMessage: _mapFailureToMessage(failure)),
        (shipData) => ShipsLoadedState(shipsList: shipData),
      );
    }
    // ShipsErrorState(errorMessage: 'Unexpected Error');
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
