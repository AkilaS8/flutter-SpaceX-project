import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_launches_past/domain/entities/response/past_data_entity.dart';
import 'package:space_x/features/feature_launches_past/domain/usecases/past_usecase.dart';


part 'past_event.dart';

part 'past_status.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class PastBloc extends Bloc<PastEvent, PastState> {
  final GetPastUseCase UseCase;

  PastBloc({required this.UseCase}) : super(PastInitialState());

  @override
  Stream<PastState> mapEventToState(PastEvent event) async* {
    if (event is GetPastDataListEvent) {
      yield PastLoadingState();
      final faliureOrPastData = await UseCase(NoParams());
          yield faliureOrPastData.fold(
          (failure)
      =>
          PastErrorState(errorMessage: _mapFailureToMessage(failure)),

    (pastData) => PastLoadedState(PastList: pastData));
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


