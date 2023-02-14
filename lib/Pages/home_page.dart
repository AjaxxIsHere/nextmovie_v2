// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nextmovie_v2/utilities/text_styles.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:nextmovie_v2/reusable_widgets/widgets.dart';

class homescreenPage extends StatefulWidget {
  const homescreenPage({super.key});

  @override
  State<homescreenPage> createState() => _homescreenPageState();
}

class _homescreenPageState extends State<homescreenPage> {
  /*-----------------------------------------------------------------------------*/
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String tmdbAPIkey = 'ed16e80fbc7853efc31460a41a8575bd';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZDE2ZTgwZmJjNzg1M2VmYzMxNDYwYTQxYTg1NzViZCIsInN1YiI6IjYzZGU1NWJiY2QyMDQ2MDA4MWUxYjhmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ej5mgpEQekD3RIlt9wOyMYoZclEjfKzLM4z_M4mv8QI';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(tmdbAPIkey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map TrendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = TrendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tvShows = tvResults['results'];
    });
    print(TrendingResults);
  }
  /*-----------------------------------------------------------------------------*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const textModified(
                text: "NextMovie", color: Colors.white, size: 24)),
        body: ListView(children: [
          /*---------------------------*/
          TrendingMoviesContainer(
            trending: trendingMovies,
          ),
          /*---------------------------*/
          MostPopularMoviesContainer(MostPopular: topRatedMovies),
          /*---------------------------*/
          TvShowsContainer(TvShows: tvShows),
          /*---------------------------*/
        ]),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.transparent),
    );
  }
}
