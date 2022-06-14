part of 'missions_bloc.dart';

abstract class MissionsEvent extends Equatable {
  const MissionsEvent();
}

class GetMissionsDataListEvent extends MissionsEvent {
  @override
  List<Object?> get props => [];
}
