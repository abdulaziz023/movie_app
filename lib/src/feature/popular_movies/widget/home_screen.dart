import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/service/app_icons.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/util/custom_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController controller;
  int pageNumber = 0;

  void pageChange(int index) {
    pageNumber = index;

    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
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
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          switch (pageNumber) {
            0 => 'What do you want to watch?',
            1 => 'Search',
            2 => 'Watch list',
            _ => '',
          },
          style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ColoredBox(color: Colors.red),
          ColoredBox(color: Colors.yellow),
          ColoredBox(color: Colors.green),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.blue,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: NavigationBar(
            onDestinationSelected: pageChange,
            selectedIndex: pageNumber,
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
                label: 'Home',
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
                label: 'Search',
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
                label: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
