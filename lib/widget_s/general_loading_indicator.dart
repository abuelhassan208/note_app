import 'package:flutter/material.dart';

class GeneralLoadingView extends StatelessWidget {
  const GeneralLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
