import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ShowADialog extends StatelessWidget {
  final int idX;

  const ShowADialog({Key? key, required this.idX}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.of(context);

    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        "Confirm",
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      content: Text(
        "Are you sure you wish to delete this item?",
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              cubit.delete(idX);
              Navigator.of(context).pop(false);
            },
            child: Text(
              "DELETE",
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "CANCEL",
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
