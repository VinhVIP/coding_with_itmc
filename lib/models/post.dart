class Post{
  String _title;
  String _path;

  Post(this._title, this._path);

  String get path => _path;

  set path(String value) {
    _path = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}