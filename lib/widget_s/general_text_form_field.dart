import 'package:flutter/material.dart';

class GeneralTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const GeneralTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      autocorrect: true,
      maxLines: 150,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
      textAlign: TextAlign.center,

      textDirection:  TextDirection.rtl,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
        hintText: "What's on your mind",
        suffixIcon: Icon(
          Icons.arrow_left,
          color: Theme.of(context).primaryColor,
        ),
        prefixIcon: Icon(
          Icons.arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        border: InputBorder.none,
      ),
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.text,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Empty Note ! ';
        } else {
          return null;
        }
      },
    );
  }
}
