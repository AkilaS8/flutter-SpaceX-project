import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';
import 'package:space_x/features/feature_missions/domain/usecases/missions_usecase.dart';

part 'missions_events.dart';

part 'missions_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class MissionsBloc extends Bloc<MissionsEvent, MissionsState> {
  final GetMissionsUseCase useCase;

  MissionsBloc({required this.useCase}) : super(MissionsInitialState());

  @override
  Stream<MissionsState> mapEventToState(MissionsEvent event) async* {
    if (event is GetMissionsDataListEvent) {
      yield MissionsLoadingState();
      final failureOrMissionsData = await useCase(NoParams());
      yield failureOrMissionsData.fold(
          (failure) =>
              MissionsErrorState(errorMessage: _mapFailureToMessage(failure)),
          (missionsData) => MissionsLoadedState(missionsList: missionsData));
    }
    // yield MissionsErrorState(errorMessage: 'Unexpected Error');

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
