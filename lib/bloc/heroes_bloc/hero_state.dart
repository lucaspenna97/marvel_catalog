import 'package:equatable/equatable.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero.dart';

class HeroState extends Equatable {
  @override
  List<Object> get props => null;
}

class HeroInitialState extends HeroState {}

class HeroStateSuccess extends HeroState {
  final List<MarvelHero> list;

  HeroStateSuccess({this.list});
}

class HeroStateWarning extends HeroState {}

class HeroStateException extends HeroState {}

class HeroStateLoading extends HeroState {}
