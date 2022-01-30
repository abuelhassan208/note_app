import 'package:flu_death_note/screens/home/component/home_body.dart';
import 'package:flutter/material.dart';
import 'component/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: const HomeBody(),
    );
  }
}
