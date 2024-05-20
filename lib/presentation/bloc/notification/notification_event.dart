part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleNotification extends NotificationEvent {
  final int floor;

  const ScheduleNotification(this.floor);

  @override
  List<Object?> get props => [floor];
}
