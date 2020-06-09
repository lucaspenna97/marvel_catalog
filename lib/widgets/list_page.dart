import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermarvelcatalog/api/resources.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_event.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero.dart';
import 'package:fluttermarvelcatalog/utils/image_variants.dart';
import 'package:fluttermarvelcatalog/widgets/details_page.dart';

class ListPage extends StatelessWidget {
  final List<MarvelHero> list;
  final BuildContext buildContext;
  static int _offset = 0;

  ListPage({this.list, this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 28,
          child: ListView(
            children: buildList(context),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.red,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: _offset >= 20 ? Colors.white : Colors.grey,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _offset >= 20
                      ? () {
                          _offset = _offset - 20;
                          BlocProvider.of<HeroBloc>(buildContext).add(
                              HeroEventSuccess(limit: 20, offset: _offset));
                        }
                      : null,
                ),
                IconButton(
                  color: _offset < 1400 ? Colors.white : Colors.grey,
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _offset < 1400
                      ? () {
                          _offset = _offset + 20;
                          BlocProvider.of<HeroBloc>(buildContext).add(
                              HeroEventSuccess(limit: 20, offset: _offset));
                        }
                      : null,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> buildList(BuildContext context) {
    List<Widget> widgets = [];

    list.forEach((hero) {
      widgets.add(
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Image.network(
                  Resources.urlImages(
                      hero.imagePath,
                      ImageVariants.LANDSCAPE_MEDIUM_175x130,
                      hero.imageExtension),
                  width: 175,
                  height: 130,
                ),
              ),
              Flexible(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    marvelHero: hero,
                                    buildContext: buildContext),
                              ),
                            );
                          },
                          child: Text(
                            hero.name,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    return widgets;
  }
}
