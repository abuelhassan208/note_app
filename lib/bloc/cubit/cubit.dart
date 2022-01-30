import 'package:flu_death_note/bloc/states/states.dart';
import 'package:flu_death_note/core/cache_sqf/cache_sqf.dart';
import 'package:flu_death_note/core/get_storage/get_storage.dart';
import 'package:flu_death_note/core/navigation/navigation.dart';
import 'package:flu_death_note/model/note_model.dart';
import 'package:flu_death_note/screens/home/view.dart';
import 'package:flu_death_note/screens/home/component/home_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntiState());

  static AppCubit of(context) => BlocProvider.of(context);

  //============ variables =============//
  late int id;
  List notes = [];
  bool isDark = false;
  late String time = formatter.format(now).toString();
  final addFormKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();
  final TextEditingController addController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat().add_y().add_M().add_d().add_Hm();

  //=========================================//
  void isDarkFun() {
    emit(AppLoadingState());
    isDark = !isDark;
    emit(AppThemeState());
    CacheStorage.cacheData.write('theme', isDark);
  }

  void closeKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
    emit(BackState());
  }

  Future<void> getAllNotes() {
    return CacheSQF.allNotes().then(
      (value) {
        notes = List.from(value.reversed);
        emit(AppGetAllNoteState());
      },
    );
  }

  void addNote(context) {
    emit(AppLoadingState());
    Note note = Note({'content': addController.text, 'time': time});
    if (!addFormKey.currentState!.validate()) return;
    CacheSQF.createNote(note);
    getAllNotes().then((value) {
      addController.clear();
      Navigation.pushReplacement(context, const HomeView());
    });
    emit(AddNoteState());
  }

  void getToEdit(Note note) {
    editController.text = note.content!;
    id = note.id!;
  }

  void editNote(context) {
    emit(AppLoadingState());
    Note note = Note({'id': id, 'content': editController.text, 'time': time});
    if (!editFormKey.currentState!.validate()) return;
    CacheSQF.updateNote(note);
    getAllNotes().then((value) {
      editController.clear();
      Navigation.pushReplacement(context, const HomeView());
    });
    emit(AppEditNoteState());
  }

  Future onDismissed(context, int id) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        emit(OnDismissedNoteState());
        return ShowADialog(
          idX: id,
        );
      },
    );
  }

  void delete(int id) {
    emit(AppLoadingState());
    CacheSQF.delete(id);
    getAllNotes();
    emit(AppDeleteNoteState());
  }
}
