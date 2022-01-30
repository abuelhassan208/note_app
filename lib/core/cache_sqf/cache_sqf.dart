import 'package:flu_death_note/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CacheSQF {
  static Future<Database?> createDatabase() async {
    Database? _dataBase;
    String path = join(await getDatabasesPath(), 'Note.db');
    _dataBase = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int v) {
        db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, content VARCHAR(1500), time VARCHAR(50))');
      },
      onOpen: (data) {
        _dataBase = data;
      },
    );
    return _dataBase;
  }

  static void createNote(Note note) {
    createDatabase().then((value) => value!.insert('notes', note.toMap()));
  }

  static void updateNote(Note note) {
    createDatabase().then((value) => value!
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]));
  }

  static Future<List<Map<String, dynamic>>> allNotes() {
    return createDatabase().then((value) => value!.query('notes'));
  }

  static void delete(int id) {
    createDatabase().then(
        (value) => value!.delete('notes', where: 'id = ?', whereArgs: [id]));
  }
}
