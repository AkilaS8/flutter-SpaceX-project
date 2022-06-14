import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';
import 'package:space_x/features/feature_rockets/domain/usecases/rockets_usecase.dart';

part 'rockets_events.dart';

part 'rockets_states.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final GetRocketsUseCase useCase;

  RocketsBloc({required this.useCase}) : super(RocketsInitialState());

  @override
  Stream<RocketsState> mapEventToState(RocketsEvent event) async* {
    if (event is GetRocketDataListEvent) {
      yield RocketsLoadingState();
      final failureOrRocketData = await useCase(NoParams());
      yield failureOrRocketData.fold(
        (failure) =>
            RocketsErrorState(errorMessage: _mapFailureToMessage(failure)),
        (rocketsData) => RocketsLoadedState(rocketsList: rocketsData),
      );
    }
    // RocketsErrorState(errorMessage: 'Unexpected Error');
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
