import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_assignment/presentation/bloc/floor/floor_bloc.dart';
import 'package:flutter_test_assignment/presentation/bloc/floor/floor_event.dart';
import 'package:flutter_test_assignment/presentation/bloc/floor/floor_state.dart';

class FloorsWidget extends StatefulWidget {
  static const String _title = "Floors";
  final int floorsCount;

  const FloorsWidget({
    super.key,
    required this.floorsCount,
  });

  @override
  State<FloorsWidget> createState() => _FloorsWidgetState();
}

class _FloorsWidgetState extends State<FloorsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    const String author = "designed by Shestopalka Roman";

    return BlocProvider(
      create: (context) => FloorBloc(),
      child: BlocBuilder<FloorBloc, FloorState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 50),
                          child: Text(
                            FloorsWidget._title,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 26,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: widget.floorsCount,
                    (context, index) {
                      final String floor = "Floor ${index + 1}";
                      Color floorColor;

                      if (state.floorStatus == FloorStatus.loading &&
                          floor == state.currentFloor) {
                        floorColor = Colors.yellow;
                      } else if (state.floorStatus == FloorStatus.current &&
                          floor == state.currentFloor) {
                        floorColor = Colors.green;
                      } else {
                        floorColor = Colors.transparent;
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 66),
                        child: GestureDetector(
                          onTap: () {
                            context.read<FloorBloc>().add(ChangeFloor(floor));
                          },
                          child: AnimatedContainer(
                            margin: const EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(16),
                              color: floorColor,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                right: 30,
                                bottom: 12,
                                left: 20,
                              ),
                              child: Text(
                                "Floor ${index + 1}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      author,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: const Color(0xFFE6E6E6),
      );
}
