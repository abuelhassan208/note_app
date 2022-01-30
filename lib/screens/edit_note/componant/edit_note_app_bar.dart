import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flu_death_note/core/navigation/navigation.dart';
import 'package:flu_death_note/screens/home/view.dart';
import 'package:flutter/material.dart';

AppBar bar(context) {
  AppCubit cubit = AppCubit.of(context);
  return AppBar(
    title: const Text(' Edit Your Note '),
    leading: IconButton(
      onPressed: () {
        cubit.editController.clear();
        Navigation.pushReplacement(context, const HomeView());
      },
      icon: const Icon(Icons.arrow_back_rounded),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.done),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          cubit.editNote(context);
        },
      )
    ],
  );
}
