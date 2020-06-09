import 'package:equatable/equatable.dart';

class ComicEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class ComicEventSuccess extends ComicEvent {
  final int idHero;

  ComicEventSuccess({this.idHero});
}

class ComicEventWarning extends ComicEvent {}

class ComicEventException extends ComicEvent {}

class ComicEventLoading extends ComicEvent {}
