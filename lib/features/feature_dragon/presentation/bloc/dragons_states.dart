part of 'dragons_bloc.dart';

abstract class DragonsState extends Equatable {
  const DragonsState();
}

class DragonsInitialState extends DragonsState {
  @override
  List<Object?> get props => [];
}

class DragonsLoadingState extends DragonsState {
  @override
  List<Object?> get props => [];
}

class DragonsLoadedState extends DragonsState {
  final List<DragonDataEntity> dragonsList;

  DragonsLoadedState({required this.dragonsList});

  @override
  List<Object?> get props => [dragonsList];
}

class DragonsErrorState extends DragonsState {
  final String errorMessage;

  DragonsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
