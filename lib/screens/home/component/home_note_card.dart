import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flu_death_note/core/navigation/navigation.dart';
import 'package:flu_death_note/model/note_model.dart';
import 'package:flu_death_note/screens/Show_note/view.dart';
import 'package:flu_death_note/screens/edit_note/view.dart';
import 'package:flu_death_note/screens/home/widget_s/on_dismiss_background_icon.dart';
import 'package:flutter/material.dart';

class HomeNoteCard extends StatelessWidget {
  final Note note;

  const HomeNoteCard({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.of(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Dismissible(
        key: ValueKey(note.id.toString()),
        confirmDismiss: (DismissDirection direction) async {
          if (direction == DismissDirection.endToStart) {
            await cubit.onDismissed(context, note.id!);
          } else {
            cubit.getToEdit(note);
            Navigation.pushReplacement(context, const EditNoteView());
          }
        },
        background: const BackgroundIcon(
          icon: Icons.edit,
          alignment: Alignment.centerLeft,
          color: Colors.blue,
        ),
        secondaryBackground: const BackgroundIcon(
          icon: Icons.delete,
          alignment: Alignment.centerRight,
          color: Colors.red,
        ),
        onDismissed: (direction) {},
        child: InkWell(
          onTap: () {
            Navigation.pushReplacement(context, ShowNote(note: note));
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_left,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 40,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              note.content.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    note.time.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
