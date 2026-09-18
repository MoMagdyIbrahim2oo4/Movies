import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/core/widgets/movies_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _searchItem = ValueNotifier<String>('');

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchItem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewInsets(
      context: context,
      removeBottom: true,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          spacing: 13.h,
          children: [
            CustomTextFormField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              prefixIcon: SvgPicture.asset(
                AppIcons.searchIcon,
                height: 10.h,
                width: 10.w,
              ),
              hintText: "search".tr(),
              onChanged: (value) => _searchItem.value = value,
            ),
            Expanded(
              child: ValueListenableBuilder<String>(
                valueListenable: _searchItem,
                builder: (context, searchItem, child) {
                  return searchItem.isEmpty
                      ? Center(child: Image.asset(AppImages.empty))
                      : MoviesGridView(
                          movies: Movie.movies,
                          crossAxisCount: 2,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
