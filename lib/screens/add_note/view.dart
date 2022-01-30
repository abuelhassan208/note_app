import 'package:flutter/material.dart';
import 'component/add_note_app_bar.dart';
import 'component/add_note_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addNoteAppBar(context),
      body: const AddNoteBody(),
    );
  }
}
