part of 'next_bloc.dart';



abstract class NextState extends Equatable {
  const NextState();
}

class NextInitialState extends NextState {

  @override
  List<Object?> get props => [];
}

class NextLoadingState extends NextState {

  @override
  List<Object?> get props => [];
}

class NextLoadedState extends NextState {
  final NextLaunchDataModelEntity NextList;

  NextLoadedState({required this.NextList});

  @override
  List<Object?> get props => [NextList];
}

class NextErrorState extends NextState {
  final String errorMessage;

  NextErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}