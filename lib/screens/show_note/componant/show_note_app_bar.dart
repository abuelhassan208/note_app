import 'package:flu_death_note/core/navigation/navigation.dart';
import 'package:flu_death_note/screens/home/view.dart';
import 'package:flutter/material.dart';

AppBar barX(context) => AppBar(
    leading: IconButton(
      onPressed: () {
        Navigation.pushReplacement(context, const HomeView());
      },
      icon: const Icon(Icons.arrow_back_rounded),
    ),
    title: const Text('Show Note'),
  );
