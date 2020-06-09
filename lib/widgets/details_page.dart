import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermarvelcatalog/api/resources.dart';
import 'package:fluttermarvelcatalog/model/marvel_hero.dart';
import 'package:fluttermarvelcatalog/utils/image_variants.dart';
import 'package:fluttermarvelcatalog/utils/strings.dart';

import 'comic_page.dart';

class DetailsPage extends StatelessWidget {
  final MarvelHero marvelHero;
  final BuildContext buildContext;

  DetailsPage({this.marvelHero, this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.network(
                Resources.urlImages(
                    marvelHero.imagePath,
                    ImageVariants.PORTRAIT_INCREDIBLE_216x324,
                    marvelHero.imageExtension),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                marvelHero.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  marvelHero.description == null ||
                          marvelHero.description.isEmpty
                      ? Strings.NO_HERO_DESCRIPTION
                      : marvelHero.description,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(
                        id: marvelHero.id,
                        buildContext: buildContext,
                      ),
                    ),
                  );
                },
                child: Text(
                  Strings.MOST_EXPENSIVE_COMIC,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
