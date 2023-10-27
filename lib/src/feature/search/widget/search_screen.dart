import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/model/movie_model.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/util/custom_extension.dart';
import '../../widget/movie_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;

  MovieModel movie = MovieModel(
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
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: TextFormField(
                controller: controller,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textUnselected,
                  ),
                  fillColor: AppColors.searchBG,
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.search,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) => MovieItem(movie: movie),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
