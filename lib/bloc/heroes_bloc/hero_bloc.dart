import 'package:bloc/bloc.dart';
import 'package:fluttermarvelcatalog/api/consumes.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero.dart';

import 'hero_event.dart';
import 'hero_state.dart';

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  @override
  HeroState get initialState => HeroInitialState();

  @override
  Stream<HeroState> mapEventToState(HeroEvent event) async* {
    try {
      if (event is HeroEventSuccess) {
        yield HeroStateLoading();
        String json =
            await Consumes.httpRequestCharacters(event.limit, event.offset);
        if (json == null || json.isEmpty) {
          print('Json nulo ou vazio');
          yield HeroStateException();
        } else {
          List<MarvelHero> heroes =
              Consumes.responseCharactersToObjectList(json);
          yield HeroStateSuccess(list: heroes);
        }
      }
    } catch (exception) {
      print('Ops, deu ruim em alguma coisa: ' + exception.toString());
      yield HeroStateException();
    }
  }
}
