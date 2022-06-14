part of 'dragons_bloc.dart';

abstract class DragonsEvent extends Equatable {
  const DragonsEvent();
}

class GetDragonsDataListEvent extends DragonsEvent {
  @override
  List<Object?> get props => [];
}