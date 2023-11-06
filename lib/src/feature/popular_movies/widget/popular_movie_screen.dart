import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constant/api_const.dart';
import '../../../common/model/movie_model.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/util/custom_extension.dart';
import '../../detail/widget/movie_detail_screen.dart';
import '../data/popular_repository.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  late final IPopularRepository repository;

  List<MovieModel> movies = [];

  @override
  void initState() {
    super.initState();
    repository = const PopularRepository();
    getMovies();
  }

  void getMovies() async {
    movies = await repository.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.searchBG,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Search',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textUnselected,
                    ),
                  ),
                  trailing: SvgPicture.asset(AppIcons.search),
                  onTap: () {},
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: movies[index]),
                    ),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(ApiConst.imageLoadEntry + movies[index].posterPath),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
