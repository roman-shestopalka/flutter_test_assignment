import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_test_assignment/notification_service.dart';
import 'package:flutter_test_assignment/presentation/bloc/house/house_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_assignment/presentation/bloc/notification/notification_bloc.dart';
import 'package:flutter_test_assignment/presentation/screens/initial/initial_screen.dart';

class FlutterTestAssignmentApp extends StatelessWidget {
  const FlutterTestAssignmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HouseBloc>(
          create: (context) =>
              HouseBloc(LocalDataSource())..add(LoadHousesEvent()),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(NotificationService()),
        ),
      ],
      child: MaterialApp(
        title: "Test Assignment",
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const InitilaScreen(),
      ),
    );
  }
}
