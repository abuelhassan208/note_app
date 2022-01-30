import 'package:flu_death_note/bloc/cubit/cubit.dart';
import 'package:flu_death_note/widget_s/general_text_form_field.dart';
import 'package:flutter/material.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.of(context);
    return Form(
      key: cubit.editFormKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GeneralTextFormField(
          controller: cubit.editController,
        ),
      ),
    );
  }
}
