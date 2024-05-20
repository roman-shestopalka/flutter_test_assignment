import 'package:flutter_bloc/flutter_bloc.dart';
import 'floor_event.dart';
import 'floor_state.dart';

class FloorBloc extends Bloc<FloorEvent, FloorState> {
  FloorBloc() : super(const FloorState(currentFloor: "Floor 1")) {
    on<ChangeFloor>((event, emit) async {
      emit(FloorState(
          currentFloor: state.currentFloor, floorStatus: FloorStatus.loading));
      await Future.delayed(const Duration(seconds: 3)); // Анімація 3 секунди
      emit(FloorState(
          currentFloor: event.newFloor, floorStatus: FloorStatus.current));
    });

    on<SetFloorStatus>((event, emit) {
      emit(FloorState(
          currentFloor: state.currentFloor, floorStatus: event.status));
    });
  }
}
