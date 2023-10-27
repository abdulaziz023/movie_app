import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/style/app_colors.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/util/custom_extension.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
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
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://th.bing.com/th/id/R.67f3c87884436a35cf9991d13adf93fd?rik=tB9ndMh9dfvhAg&pid=ImgRaw&r=0',
                        ),
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
