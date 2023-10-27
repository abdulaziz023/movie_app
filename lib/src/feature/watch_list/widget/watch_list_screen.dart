import 'package:flutter/material.dart';

import '../../../common/model/movie_model.dart';
import '../../../common/style/app_colors.dart';
import '../../widget/movie_item.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  MovieModel movie = const MovieModel(
    adult: true,
    backdropPath: '/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg',
    genreIds: [],
    id: 1,
    originalLanguage: 'en',
    originalTitle: '',
    overview: '',
    popularity: 7000,
    posterPath: '/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg',
    releaseDate: '1200',
    title: 'Spiderman',
    video: true,
    voteAverage: 6.6,
    voteCount: 100,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemBuilder: (context, index) => MovieItem(movie: movie),
      ),
    );
  }
}
