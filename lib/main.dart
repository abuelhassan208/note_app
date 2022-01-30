import 'package:flu_death_note/bloc/states/states.dart';
import 'package:flu_death_note/core/bloc_observer.dart';
import 'package:flu_death_note/core/get_storage/get_storage.dart';
import 'package:flu_death_note/screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc/cubit/cubit.dart';
import 'core/theme/theme.dart';

void main() async {
  await GetStorage.init();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllNotes(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
            themeMode: CacheStorage.cacheData.read('theme') ?? cubit.isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: light(),
            darkTheme: dark(),
          );
        },
      ),
    );
  }
}
