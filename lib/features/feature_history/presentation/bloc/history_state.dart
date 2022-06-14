part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitialState extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoadingState extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoadedState extends HistoryState {
  final List<HistoryDataModelEntity> historyList;

  HistoryLoadedState({required this.historyList});

  @override
  List<Object?> get props => [historyList];
}

class HistoryErrorState extends HistoryState {
  final String errorMessage;

  HistoryErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
