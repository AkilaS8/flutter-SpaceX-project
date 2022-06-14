import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';
import 'package:space_x/features/feature_history/domain/use_cases/history_usecase.dart';

part 'history_event.dart';
part 'history_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {

  final GetHistoryUseCase useCase;

  HistoryBloc({required this.useCase}) : super(HistoryInitialState());

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async*{
    if (event is GetHistoryDataListEvent) {
      yield HistoryLoadingState();
      final failureOrHistoryData = await useCase(NoParams());
      yield failureOrHistoryData.fold(
            (failure) =>
            HistoryErrorState(errorMessage: _mapFailureToMessage(failure)),
            (historyData) => HistoryLoadedState(historyList: historyData),
      );
    }
     // yield HistoryErrorState(errorMessage: 'Unexpected error');

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