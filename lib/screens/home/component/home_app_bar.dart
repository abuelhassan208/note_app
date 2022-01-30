import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flu_death_note/core/navigation/navigation.dart';
import 'package:flu_death_note/screens/add_note/view.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(context) => AppBar(
      title: const Text('Notes'),
      leading: IconButton(
        onPressed: () {
          AppCubit.of(context).isDarkFun();
        },
        icon: const Icon(
          Icons.dark_mode_sharp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigation.pushReplacement(context, const AddNoteView());
          },
          icon: const Icon(Icons.plus_one),
        )
      ],
    );
