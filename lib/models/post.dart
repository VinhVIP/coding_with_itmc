class Post {
  String _title;
  String _pathLesson, _pathChoice;

  Post(this._title, this._pathLesson, this._pathChoice);

  get pathChoice => _pathChoice;

  set pathChoice(value) {
    _pathChoice = value;
  }

  String get pathLesson => _pathLesson;

  set pathLesson(String value) {
    _pathLesson = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}