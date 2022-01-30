class Note {
  int? _id;
  String? _content;
  String? _time;

  Note(dynamic obj) {
    _id = obj['id'];
    _content = obj['content'];
    _time = obj['time'];
  }

  Note.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _content = data['content'];
    _time = data['time'];
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'content': _content, 'time': _time};
  }

  int? get id => _id;

  String? get content => _content;

  String? get time => _time;
}
