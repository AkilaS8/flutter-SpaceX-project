part of 'past_bloc.dart';

abstract class PastState extends Equatable {
  const PastState();
}

class PastInitialState extends PastState {

  @override
  List<Object?> get props => [];
}

class PastLoadingState extends PastState {

  @override
  List<Object?> get props => [];
}

class PastLoadedState extends PastState {
  final List<PastDataModelEntity> PastList;

  PastLoadedState({required this.PastList});

  @override
  List<Object?> get props => [PastList];
}

class PastErrorState extends PastState {
  final String errorMessage;

  PastErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}