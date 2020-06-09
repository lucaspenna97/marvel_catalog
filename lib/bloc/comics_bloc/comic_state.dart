import 'package:equatable/equatable.dart';
import 'package:fluttermarvelcatalog/model/marvel_comic.dart';

class ComicState extends Equatable {
  @override
  List<Object> get props => null;
}

class ComicInitialState extends ComicState {}

class ComicStateSuccess extends ComicState {
  final MarvelComic comic;

  ComicStateSuccess({this.comic});
}

class ComicStateWarning extends ComicState {}

class ComicStateException extends ComicState {}

class ComicStateLoading extends ComicState {}
