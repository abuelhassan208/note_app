import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flu_death_note/bloc/states/states.dart';
import 'package:flu_death_note/model/note_model.dart';
import 'package:flu_death_note/screens/home/component/home_divider.dart';
import 'package:flu_death_note/screens/home/component/home_note_card.dart';
import 'package:flu_death_note/widget_s/general_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.of(context);
        if (state is AppLoadingState) {
          return const GeneralLoadingView();
        } else {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemCount: cubit.notes.length,
              itemBuilder: (context, index) {
                Note note = Note.fromMap(cubit.notes[index]);
                return HomeNoteCard(
                  note: note,
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5),
                child: homeDivider(context),
              ),
            ),
          );
        }
      },
    );
  }
}
