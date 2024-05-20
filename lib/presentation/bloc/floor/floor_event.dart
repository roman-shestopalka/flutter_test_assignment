import 'package:equatable/equatable.dart';
import 'package:flutter_test_assignment/presentation/bloc/floor/floor_state.dart';

abstract class FloorEvent extends Equatable {
  const FloorEvent();

  @override
  List<Object> get props => [];
}

class ChangeFloor extends FloorEvent {
  final String newFloor;

  const ChangeFloor(this.newFloor);

  @override
  List<Object> get props => [newFloor];
}

class SetFloorStatus extends FloorEvent {
  final FloorStatus status;

  const SetFloorStatus(this.status);

  @override
  List<Object> get props => [status];
}
