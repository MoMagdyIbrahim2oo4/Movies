import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/features/browse/data/models/category_model.dart';
import 'package:movies/features/browse/presentation/cubit/movie_category_cubit.dart';

import '../../../browse/presentation/screens/browse_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayoutScreen> {
  int _selectedIndex = 0;
  late final MovieCategoryCubit _movieCategoryCubit;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _movieCategoryCubit = getIt<MovieCategoryCubit>()
      ..movieCategory(CategoryModel.categories.first.genrsId);
    _screens = [
      HomeScreen(onBrowse: () => _onItemTapped(2)),
      const SearchScreen(),
      const BrowseScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    final returningToHome = index == 0 && _selectedIndex != 0;
    setState(() {
      _selectedIndex = index;
    });

    if (returningToHome) {
      final categories = CategoryModel.categories;
      final currentIndex = categories.indexWhere(
        (category) =>
            category.genrsId == _movieCategoryCubit.selectedCategoryId,
      );
      final nextIndex = (currentIndex + 1) % categories.length;
      _movieCategoryCubit.movieCategory(categories[nextIndex].genrsId);
    }
  }

  @override
  void dispose() {
    _movieCategoryCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: _movieCategoryCubit,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: IndexedStack(index: _selectedIndex, children: _screens),
            ),
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: SafeArea(
                top: false,
                child: CustomBottomNavBar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
