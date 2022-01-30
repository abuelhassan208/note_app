import 'package:flu_death_note/model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowNoteBody extends StatelessWidget {
  final Note note;

  const ShowNoteBody({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              note.content!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
