part of 'rockets_bloc.dart';

abstract class RocketsEvent extends Equatable {
  const RocketsEvent();
}

class GetRocketDataListEvent extends RocketsEvent {
  @override
  List<Object?> get props => [];
}
