import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/presentation/bloc/house/house_bloc.dart';
import 'package:flutter_test_assignment/presentation/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitilaScreen extends StatelessWidget {
  static const String _title = "Test Task";
  static const String _author = "designed by Roman Shestopalka";
  static const String _image = "assets/images/bullet_dog.jpeg";
  const InitilaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      body: BlocBuilder<HouseBloc, HouseState>(
        builder: (context, state) {
          return _buildBody();
        },
      ),
    );
  }

  SafeArea _buildBody() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              _title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(_image),
            ),
            const SizedBox(
              height: 31,
            ),
            const CustomButton(),
            const Spacer(),
            const Text(
              _author,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 57,
      child: OutlinedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "Enter",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
