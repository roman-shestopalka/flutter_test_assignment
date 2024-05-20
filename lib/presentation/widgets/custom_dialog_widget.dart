import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_assignment/data/models/house_model.dart';
import 'package:flutter_test_assignment/presentation/bloc/house/house_bloc.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController floorsController = TextEditingController();

    const String firstTitle = "Name";
    const String secondTitle = "Floors count";

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE6E6E6),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 32,
            bottom: 10,
            left: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitleAndIconButton(context),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstTitle,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Text(
                        secondTitle,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 142,
                        height: 20,
                        color: Colors.white,
                        child: TextField(
                          controller: nameController,
                          showCursor: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Container(
                        width: 37,
                        height: 20,
                        color: Colors.white,
                        child: TextField(
                          controller: floorsController,
                          showCursor: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  SizedBox(
                    width: 100,
                    height: 24,
                    child: OutlinedButton(
                      onPressed: () {
                        final String name = nameController.text;
                        final int floorsCount =
                            int.parse(floorsController.text);
                        final HouseModel house = HouseModel(
                          name: name,
                          floorsCount: floorsCount,
                          id: null,
                        );
                        context.read<HouseBloc>().add(AddHouseEvent(house));
                        Navigator.of(context).pop();
                        nameController.clear();
                        floorsController.clear();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Add"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndIconButton(BuildContext context) {
    const String title = "Add house";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 30,
        ),
        const Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final double width;
  const CustomTextField({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 20,
      color: Colors.white,
      child: const TextField(
        showCursor: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: Colors.white,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final String title;
  const FormTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
