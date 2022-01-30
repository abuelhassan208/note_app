import 'package:flu_death_note/screens/edit_note/componant/edit_note_app_bar.dart';
import 'package:flu_death_note/screens/edit_note/componant/edit_note_body.dart';
import 'package:flutter/material.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      body: const EditNoteBody(),
    );
  }
}
