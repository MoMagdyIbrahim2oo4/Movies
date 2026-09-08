import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/search/presentation/view/movies_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchItem = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        spacing: 13.h,
        children: [
          CustomTextFormField(
            prefixIcon: SvgPicture.asset(
              AppIcons.searchIcon,
              height: 10.h,
              width: 10.w,
            ),
            hintText: "search".tr(),
            onChanged: (value) {
              setState(() {
                searchItem = value;
              });
            },
          ),
          Expanded(
            child: searchItem.isEmpty
                ? Center(child: Image.asset(AppImages.empty))
                : MoviesGridVew(),
          ),
        ],
      ),
    );
  }
}
