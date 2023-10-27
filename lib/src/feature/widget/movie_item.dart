import 'package:flutter/cupertino.dart';

import '../../common/constant/api_const.dart';
import '../../common/model/movie_model.dart';
import '../../common/style/app_colors.dart';
import '../../common/util/custom_extension.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movie,
    super.key,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(ApiConst.imageLoadEntry + movie.posterPath),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MovieDetailWidget(
                    color: AppColors.yellow,
                    icon: CupertinoIcons.star,
                    text: movie.voteAverage.toStringAsFixed(1),
                  ),
                  MovieDetailWidget(
                    icon: CupertinoIcons.heart,
                    text: movie.voteCount.toString(),
                  ),
                  MovieDetailWidget(
                    icon: CupertinoIcons.calendar,
                    text: movie.releaseDate.substring(0, 4),
                  ),
                  MovieDetailWidget(
                    icon: CupertinoIcons.globe,
                    text: movie.originalLanguage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    this.color = AppColors.white,
    required this.text,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: context.textTheme.labelSmall?.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

