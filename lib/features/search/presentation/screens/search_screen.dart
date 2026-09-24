import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/core/widgets/movies_grid_view.dart';
import 'package:movies/features/search/presentation/cubit/search_cubit.dart';

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
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: Builder(
        builder: (context) {
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
                    onChanged: (value) {
                      _searchItem.value = value;

                      context.read<SearchCubit>().search(value);
                    },
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _searchItem,
                      builder: (context, searchItem, child) {
                        return searchItem.isEmpty
                            ? Center(child: Image.asset(AppImages.empty))
                            : BlocBuilder<SearchCubit, SearchState>(
                                builder: (context, state) {
                                  switch (state) {
                                    case SearchInitial():
                                    case SearchLoading():
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    case SearchFailure():
                                      return Center(
                                        child: Text(
                                          'Error : ${state.message}',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                        ),
                                      );
                                    case SearchSuccess():
                                      return MoviesGridView(
                                        movies: state.movies,
                                        crossAxisCount: 2,
                                      );
                                  }
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
