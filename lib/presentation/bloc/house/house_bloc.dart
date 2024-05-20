import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_assignment/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_test_assignment/data/models/house_model.dart';

part 'house_event.dart';
part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final LocalDataSource _localDataSource;
  HouseBloc(this._localDataSource) : super(InitialHouseState()) {
    on<LoadHousesEvent>((event, emit) async {
      emit(HouseLoadingState());
      try {
        final houses = await _localDataSource.houses();
        emit(HouseLoadedState(houses));
      } catch (e) {
        emit(HouseErrorState(e.toString()));
      }
    });

    on<AddHouseEvent>(
      (event, emit) async {
        try {
          await _localDataSource.insertHouse(event.houseModel);
          final houses = await _localDataSource.houses();
          emit(HouseLoadedState(houses));
        } catch (e) {
          emit(HouseErrorState(e.toString()));
        }
      },
    );
  }
}
