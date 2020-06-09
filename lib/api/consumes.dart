import 'dart:convert';

import 'package:fluttermarvelcatalog/api/resources.dart';
import 'package:fluttermarvelcatalog/model/marvel_comic.dart';
import 'package:fluttermarvelcatalog/model/marvel_comic_response.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero_response.dart';
import 'package:http/http.dart';

class Consumes {
  ///Async requests from the Marvel servers
  static Future<String> httpRequestCharacters(int limit, int offset) async {
    try {
      String url = Resources.urlCharacters(limit, offset);
      print('Request: ' + url);
      Response response = await get(url);

      int statusCode = response.statusCode;

      if (statusCode != null && statusCode == 200) {
        String json = response.body;
        if (json == null || json.isEmpty) {
          print('String json nula ou vazia.');
          return null;
        } else {
          return json;
        }
      } else {
        print('Código http diferente de OK: ' + statusCode.toString());
        return null;
      }
    } catch (exception) {
      print(
          "Exception durante a chamada a API Marvel: " + exception.toString());
      return null;
    }
  }

  static Future<String> httpRequestComics(int heroId, int limit) async {
    try {
      String url = Resources.urlComics(heroId, limit);
      print('Request: ' + url);
      Response response = await get(url);

      int statusCode = response.statusCode;

      if (statusCode != null && statusCode == 200) {
        String json = response.body;
        if (json == null || json.isEmpty) {
          print('String json nula ou vazia.');
          return null;
        } else {
          return json;
        }
      } else {
        print('Código http diferente de OK: ' + statusCode.toString());
        return null;
      }
    } catch (exception) {
      print(
          "Exception durante a chamada a API Marvel: " + exception.toString());
      return null;
    }
  }

  /// Parse json to object
  static List<MarvelHero> responseCharactersToObjectList(String json) {
    List<MarvelHero> heroesList = [];
    MarvelHeroResponse catalog =
        new MarvelHeroResponse.fromJson(jsonDecode(json));

    catalog.data.results.forEach((value) {
      heroesList.add(MarvelHero(
          id: value.id,
          name: value.name,
          description: value.description,
          imagePath: value.thumbnail.path,
          imageExtension: value.thumbnail.extension));
    });

    return heroesList;
  }

  static MarvelComic responseComicsToObject(String json) {
    double auxPrintPrice = 0.0;
    MarvelComic marvelComic = new MarvelComic();
    MarvelComicResponse comic =
        new MarvelComicResponse.fromJson(jsonDecode(json));

    comic.data.results.forEach((comic) {
      comic.prices.forEach((value) {
        if (value.type == "printPrice" && value.price > auxPrintPrice) {
          auxPrintPrice = value.price;
          marvelComic.id = comic.id;
          marvelComic.comicTitle = comic.title;
          marvelComic.description = comic.description;
          marvelComic.imagePath = comic.thumbnail.path;
          marvelComic.printPrice = value.price;
          marvelComic.pageCount = comic.pageCount;
          marvelComic.imageExtension = comic.thumbnail.extension;
        }
      });
    });

    return marvelComic;
  }
}
