class MarvelComic {
  int _id;
  String _comicTitle;
  String _description;
  String _imagePath;
  double _printPrice;
  int _pageCount;
  String _imageExtension;

  MarvelComic();

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get comicTitle => _comicTitle;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  int get pageCount => _pageCount;

  set pageCount(int value) {
    _pageCount = value;
  }

  double get printPrice => _printPrice;

  set printPrice(double value) {
    _printPrice = value;
  }

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }

  set comicTitle(String value) {
    _comicTitle = value;
  }

  String get imageExtension => _imageExtension;

  set imageExtension(String value) {
    _imageExtension = value;
  }

  @override
  String toString() {
    return 'MarvelComic{_id: $_id, _comicTitle: $_comicTitle, _imagePath: $_imagePath, _printPrice: $_printPrice, _pageCount: $_pageCount, _imageExtension: $_imageExtension}';
  }
}
