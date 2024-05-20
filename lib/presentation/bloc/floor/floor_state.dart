import 'package:equatable/equatable.dart';

enum FloorStatus { current, loading, idle }

class FloorState extends Equatable {
  final String currentFloor;
  final FloorStatus floorStatus;

  const FloorState(
      {required this.currentFloor, this.floorStatus = FloorStatus.idle});

  @override
  List<Object?> get props => [currentFloor, floorStatus];
}
