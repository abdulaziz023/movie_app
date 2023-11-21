import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/service/db_service.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/util/custom_extension.dart';
import '../../../common/widget/app.dart';
import '../../search/widget/search_screen.dart';
import '../../watch_list/widget/watch_list_screen.dart';
import 'popular_movie_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final PageController controller;
  late final ValueNotifier<int> pageNumberNotifier;

  late final FocusNode focus;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    focus = FocusNode(debugLabel: 'search_text_field_focus');
    pageNumberNotifier = ValueNotifier<int>(0);
  }

  void pageChange(int index) {
    pageNumberNotifier.value = index;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    pageNumberNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder<int>(
          valueListenable: pageNumberNotifier,
          builder: (context, pageNumber, _) {
            return Text(
              switch (pageNumber) {
                0 => context.l10n.whatToWatch,
                1 => context.l10n.search,
                2 => context.l10n.whatToWatch,
                _ => '',
              },
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.white,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                title:  Text(context.l10n.chooseLan),
                actions: [
                  TextButton(
                    onPressed: () async {
                      context.findAncestorStateOfType<AppState>()?.changeLocale(const Locale('en'));
                      await $storage.setString(StorageKeys.language.key, 'en');
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('English'),
                  ),
                  TextButton(
                    onPressed: () async {
                      context.findAncestorStateOfType<AppState>()?.changeLocale(const Locale('uz'));
                      await $storage.setString(StorageKeys.language.key, 'uz');
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('O`zbekcha'),
                  ),
                ],
              ),
            ),
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: pageChange,
        children: const [
          PopularMovieScreen(),
          SearchScreen(),
          WatchListScreen(),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.blue,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: NavigationBar(
            onDestinationSelected: pageChange,
            selectedIndex: pageNumberNotifier.value,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(AppIcons.home),
                selectedIcon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.l10n.home,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(AppIcons.search),
                selectedIcon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.l10n.search,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(AppIcons.save),
                selectedIcon: SvgPicture.asset(
                  AppIcons.save,
                  colorFilter: const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.l10n.save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
