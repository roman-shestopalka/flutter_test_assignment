part of 'house_bloc.dart';

abstract class HouseState extends Equatable {
  const HouseState();

  @override
  List<Object?> get props => [];
}

class InitialHouseState extends HouseState {}

class HouseLoadingState extends HouseState {}

class HouseLoadedState extends HouseState {
  final List<HouseModel> houses;

  const HouseLoadedState(this.houses);

  @override
  List<Object?> get props => [houses];
}

class HouseErrorState extends HouseState {
  final String message;

  const HouseErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
