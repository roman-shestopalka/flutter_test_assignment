import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/data/models/house_model.dart';
import 'package:flutter_test_assignment/presentation/bloc/house/house_bloc.dart';
import 'package:flutter_test_assignment/presentation/bloc/notification/notification_bloc.dart';
import 'package:flutter_test_assignment/presentation/widgets/custom_dialog_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_assignment/presentation/screens/floor/floors_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: BlocBuilder<HouseBloc, HouseState>(
        builder: (context, state) {
          if (state is HouseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HouseLoadedState) {
            return ListOfHouses(
              houses: state.houses,
            );
          } else if (state is HouseErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: Text("No houses added!"));
          }
        },
      ),
    );
  }
}

class ListOfHouses extends StatelessWidget {
  final List<HouseModel> houses;

  const ListOfHouses({
    super.key,
    required this.houses,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 66),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 30,
              ),
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const CustomDialogWidget());
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox.shrink(),
                    Text("Add house"),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  final house = houses[index];
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<NotificationBloc>(context)
                          .add(ScheduleNotification(house.floorsCount));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FloorsWidget(
                            floorsCount: house.floorsCount,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          right: 30,
                          bottom: 12,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "House",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 120,
                            ),
                            Expanded(
                              child: Text(
                                houses[index].name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
