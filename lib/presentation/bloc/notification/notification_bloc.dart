import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_assignment/notification_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService notificationService;
  Timer? _timer;

  NotificationBloc(this.notificationService) : super(NotificationInitial()) {
    on<ScheduleNotification>(_onStartNotification);
  }

  void _onStartNotification(
      ScheduleNotification event, Emitter<NotificationState> emit) async {
    await notificationService.initNotifications();

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) async {
        await notificationService.showNotification(
          title: "Floor status Updated",
          body: "Current floor status: ${event.floor}",
        );
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
