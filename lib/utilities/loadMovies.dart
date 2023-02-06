/*import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:nextmovie_v2/Pages/home_page.dart';

loadmovies() async {
  const String tmdbAPIkey = 'ed16e80fbc7853efc31460a41a8575bd';
  const readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZDE2ZTgwZmJjNzg1M2VmYzMxNDYwYTQxYTg1NzViZCIsInN1YiI6IjYzZGU1NWJiY2QyMDQ2MDA4MWUxYjhmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ej5mgpEQekD3RIlt9wOyMYoZclEjfKzLM4z_M4mv8QI';

  TMDB tmdbWithCustomLogs = TMDB(ApiKeys(tmdbAPIkey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ));

  Map TrendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
  //print(TrendingResults);

  return TrendingResults['results'];
}*/
