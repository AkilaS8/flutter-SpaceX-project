import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';
import 'package:space_x/features/feature_next_lunch/domain/usecses/next_usecase.dart';
part 'next_event.dart';
part 'next_status.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class NextBloc extends Bloc<NextEvent, NextState> {
  final GetNextUseCase UseCase;

  NextBloc({required this.UseCase}) : super(NextInitialState());

  @override
  Stream<NextState> mapEventToState(NextEvent event) async* {
    if (event is GetNextDataListEvent) {
      yield NextLoadingState();
      final faliureOrNextData = await UseCase(NoParams());
      yield faliureOrNextData.fold(
              (failure)
          =>
              NextErrorState(errorMessage: _mapFailureToMessage(failure)),

              (NextData) => NextLoadedState(NextList: NextData));
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