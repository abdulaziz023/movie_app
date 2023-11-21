import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/model/movie_model.dart';
import '../../../common/service/db_service.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/util/custom_extension.dart';
import '../../widget/movie_item.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => WatchListScreenState();
}

class WatchListScreenState extends State<WatchListScreen> {
  final ValueNotifier<List<MovieModel>> movies = ValueNotifier<List<MovieModel>>([]);

  void getMovies() async {
    final List<MovieModel> retrievedMovies = await DBService().getMovies();
    movies.value = retrievedMovies;
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: ValueListenableBuilder<List<MovieModel>>(
        valueListenable: movies,
        builder: (context, movieList, child) {
          return movieList.isEmpty
              ? Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.emptyBox),
                  Text(
                    context.l10n.thereIsNo,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    context.l10n.findMovie,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            itemCount: movieList.length,
            itemBuilder: (context, index) => MovieItem(
              movie: movieList[index],
            ),
          );
        },
      ),
    );
  }
}
