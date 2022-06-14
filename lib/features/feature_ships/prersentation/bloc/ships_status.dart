part of 'ships_bloc.dart';

abstract class ShipsState extends Equatable {
  const ShipsState();
}

//init
class ShipsInitialState extends ShipsState {

  @override
  List<Object?> get props => [];
}

//loading
class ShipsLoadingState extends ShipsState {
  @override
  List<Object?> get props => [];
}

//after loaded
class ShipsLoadedState extends ShipsState {
  final List<ShipDataModelEntity> shipsList;

  ShipsLoadedState({required this.shipsList});

  @override
  List<Object?> get props => [shipsList];
}

//error
class ShipsErrorState extends ShipsState {
  final String errorMessage;

  ShipsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
