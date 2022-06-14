part of 'rockets_bloc.dart';

abstract class RocketsState extends Equatable {
  const RocketsState();
}

class RocketsInitialState extends RocketsState {

  @override
  List<Object?> get props => [];
}

class RocketsLoadingState extends RocketsState {

  @override
  List<Object?> get props => [];
}

class RocketsLoadedState extends RocketsState {
  final List<RocketDataEntity> rocketsList;

  RocketsLoadedState({required this.rocketsList});

  @override
  List<Object?> get props => [rocketsList];
}

class RocketsErrorState extends RocketsState {
  final String errorMessage;

  RocketsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}