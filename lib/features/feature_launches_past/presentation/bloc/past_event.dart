part of 'past_bloc.dart';

abstract class PastEvent extends Equatable {
  const PastEvent();
}

class GetPastDataListEvent extends PastEvent {
  @override
  List<Object?> get props => [];
}
