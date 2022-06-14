part of 'upcoming_bloc.dart';


abstract class UpcomingState extends Equatable {
  const UpcomingState();
}

class UpcomingInitialState extends UpcomingState {

  @override
  List<Object?> get props => [];
}

class UpcomingLoadingState extends UpcomingState {

  @override
  List<Object?> get props => [];
}

class UpcomingLoadedState extends UpcomingState {
  final List<UpcomingDataModelEntity> upcomingList;

  UpcomingLoadedState({required this.upcomingList});

  @override
  List<Object?> get props => [upcomingList];
}

class UpcomingErrorState extends UpcomingState {
  final String errorMessage;

  UpcomingErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}