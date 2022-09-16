import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_personal_website/Bloc/index_navigator_bloc.dart';

PageController pageController = PageController();

class CustomTextNavigator extends StatelessWidget {
  final int index;
  final int bottomControllerIndex;
  final String libelle;
  const CustomTextNavigator(
      {required this.index,
      required this.bottomControllerIndex,
      required this.libelle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bottomControllerIndex == index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          libelle,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          libelle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      );
    }
  }
}
