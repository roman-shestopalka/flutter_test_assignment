part of 'house_bloc.dart';

abstract class HouseEvent extends Equatable {
  const HouseEvent();

  @override
  List<Object> get props => [];
}

class LoadHousesEvent extends HouseEvent {}

class AddHouseEvent extends HouseEvent {
  final HouseModel houseModel;

  const AddHouseEvent(this.houseModel);

  @override
  List<Object> get props => [];
}
