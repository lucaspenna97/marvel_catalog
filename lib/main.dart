import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/comics_bloc/comic_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_bloc.dart';
import 'package:fluttermarvelcatalog/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HeroBloc>(
            builder: (BuildContext context) => HeroBloc(),
          ),
          BlocProvider<ComicBloc>(
            builder: (BuildContext context) => ComicBloc(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
