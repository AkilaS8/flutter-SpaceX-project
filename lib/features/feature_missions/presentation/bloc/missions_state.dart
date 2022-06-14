part of 'missions_bloc.dart';

abstract class MissionsState extends Equatable {
  const MissionsState();
}

class MissionsInitialState extends MissionsState {
  @override
  List<Object?> get props => [];
}

class MissionsLoadingState extends MissionsState {
  @override
  List<Object?> get props => [];
}

class MissionsLoadedState extends MissionsState {
  final List<MissionsDataModelEntity> missionsList;

  MissionsLoadedState({required this.missionsList});

  @override
  List<Object?> get props => [missionsList];
}

class MissionsErrorState extends MissionsState {
  final String errorMessage;

  MissionsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
