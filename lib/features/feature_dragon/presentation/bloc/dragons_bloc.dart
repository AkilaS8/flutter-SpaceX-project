import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';
import 'package:space_x/features/feature_dragon/domain/usecases/dragons_usecase.dart';

part 'dragons_events.dart';

part 'dragons_states.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class DragonsBloc extends Bloc<DragonsEvent, DragonsState> {
  final GetDragonsUseCase useCase;

  DragonsBloc({required this.useCase}) : super(DragonsInitialState());

  @override
  Stream<DragonsState> mapEventToState(DragonsEvent event) async* {
    if (event is GetDragonsDataListEvent) {
      yield DragonsLoadingState();
      final failureOrDragonData = await useCase(NoParams());
      yield failureOrDragonData.fold(
        (failure) =>
            DragonsErrorState(errorMessage: _mapFailureToMessage(failure)),
        (dragonsData) => DragonsLoadedState(dragonsList: dragonsData),
      );
    }
    // DragonsErrorState(errorMessage: 'Unexpected Error');

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
