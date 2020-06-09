import 'package:equatable/equatable.dart';

class HeroEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class HeroEventSuccess extends HeroEvent {
  final int limit;
  final int offset;

  HeroEventSuccess({this.limit, this.offset});
}

class HeroEventWarning extends HeroEvent {}

class HeroEventException extends HeroEvent {}

class HeroEventLoading extends HeroEvent {}
