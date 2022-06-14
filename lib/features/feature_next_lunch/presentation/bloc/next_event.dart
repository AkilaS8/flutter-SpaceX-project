part of 'next_bloc.dart';

abstract class NextEvent extends Equatable {
  const NextEvent();
}

class GetNextDataListEvent extends NextEvent {
  @override
  List<Object?> get props => [];
}
