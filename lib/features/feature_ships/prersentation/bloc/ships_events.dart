part of 'ships_bloc.dart';

abstract class ShipsEvent extends Equatable {
  const ShipsEvent();
}

class GetShipsDataListEvent extends ShipsEvent {
  @override
  List<Object?> get props => [];
}