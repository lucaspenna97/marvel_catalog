import 'package:bloc/bloc.dart';
import 'package:fluttermarvelcatalog/api/consumes.dart';
import 'package:fluttermarvelcatalog/model/marvel_comic.dart';

import 'comic_event.dart';
import 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  @override
  ComicState get initialState => ComicInitialState();

  @override
  Stream<ComicState> mapEventToState(ComicEvent event) async* {
    try {
      if (event is ComicEventSuccess) {
        yield ComicStateLoading();
        String json = await Consumes.httpRequestComics(event.idHero, 100);
        if (json == null || json.isEmpty) {
          print('Json nulo ou vazio');
          yield ComicStateException();
        } else {
          MarvelComic marvelComic = Consumes.responseComicsToObject(json);
          if (marvelComic.id == null) {
            yield ComicStateException();
          } else {
            yield ComicStateSuccess(comic: marvelComic);
          }
        }
      }
    } catch (exception) {
      print('Ops, deu ruim em alguma coisa: ' + exception.toString());
      yield ComicStateException();
    }
  }
}
