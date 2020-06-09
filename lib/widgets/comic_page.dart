import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermarvelcatalog/api/resources.dart';
import 'package:fluttermarvelcatalog/bloc/comics_bloc/comic_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/comics_bloc/comic_event.dart';
import 'package:fluttermarvelcatalog/bloc/comics_bloc/comic_state.dart';
import 'package:fluttermarvelcatalog/model/marvel_comic.dart';
import 'package:fluttermarvelcatalog/utils/image_variants.dart';
import 'package:fluttermarvelcatalog/utils/strings.dart';

import 'commons/error_page.dart';
import 'commons/loading_page.dart';

class ComicPage extends StatelessWidget {
  final int id;
  final BuildContext buildContext;

  ComicPage({this.id, this.buildContext});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ComicBloc>(buildContext).add(ComicEventSuccess(idHero: id));

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ComicBloc, ComicState>(
          bloc: BlocProvider.of<ComicBloc>(buildContext),
          builder: (BuildContext context, ComicState state) {
            if (state is ComicStateSuccess) {
              return buildScreen(state.comic);
            } else if (state is ComicStateException) {
              return ErrorPage(
                function: () {
                  BlocProvider.of<ComicBloc>(buildContext)
                      .add(ComicEventSuccess(idHero: id));
                },
              );
            } else if (state is ComicStateLoading) {
              return LoadingPage();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildScreen(MarvelComic comic) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              Resources.urlImages(
                comic.imagePath,
                ImageVariants.PORTRAIT_INCREDIBLE_216x324,
                comic.imageExtension,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              comic.comicTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  Strings.PRICE + comic.printPrice.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                Text(
                  Strings.PAGES + comic.pageCount.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              comic.description == null || comic.description.isEmpty
                  ? Strings.NO_COMIC_DESCRIPTION
                  : comic.description,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
