import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/usecases/upcoming_usecase.dart';

part 'upcoming_states.dart';
part 'upcoming_events.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState>{
  final GetUpcomingUseCase useCase;

  UpcomingBloc({required this.useCase}) : super(UpcomingInitialState());

  @override
  Stream<UpcomingState> mapEventToState(UpcomingEvent event) async*{
    if (event is GetUpcomingDataListEvent) {
      yield UpcomingLoadingState();
      final failureOrRocketData = await useCase(NoParams());
      yield failureOrRocketData.fold(
            (failure) =>
            UpcomingErrorState(errorMessage: _mapFailureToMessage(failure)),
            (upcomingData) => UpcomingLoadedState(upcomingList: upcomingData));
    }

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
