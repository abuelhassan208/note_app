import 'package:flu_death_note/model/note_model.dart';
import 'package:flu_death_note/screens/Show_note/componant/show_note_app_bar.dart';
import 'package:flu_death_note/screens/show_note/componant/show_note_body.dart';
import 'package:flutter/material.dart';

class ShowNote extends StatelessWidget {
  final Note note;

  const ShowNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barX(context),
      body: ShowNoteBody(
        note: note,
      ),
    );
  }
}
