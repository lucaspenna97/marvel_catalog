import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_bloc.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_event.dart';
import 'package:fluttermarvelcatalog/bloc/heroes_bloc/hero_state.dart';
import 'package:fluttermarvelcatalog/utils/strings.dart';
import 'package:fluttermarvelcatalog/widgets/commons/loading_page.dart';

import 'commons/error_page.dart';
import 'list_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HeroBloc>(context)
        .add(HeroEventSuccess(limit: 20, offset: 0));

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Strings.MARVEL_HEROES),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HeroBloc, HeroState>(
          bloc: BlocProvider.of<HeroBloc>(context),
          builder: (BuildContext context, HeroState state) {
            if (state is HeroStateSuccess) {
              return ListPage(list: state.list, buildContext: context);
            } else if (state is HeroStateException) {
              return ErrorPage(function: () {
                BlocProvider.of<HeroBloc>(context)
                    .add(HeroEventSuccess(limit: 20, offset: 0));
              });
            } else if (state is HeroStateLoading) {
              return LoadingPage();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
