import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/features/browse/presentation/view/categories_grid_view.dart';
import 'package:movies/features/browse/presentation/widgets/categories.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<String> categories = [
    'Action'.tr(),
    'Adventure'.tr(),
    'Animation'.tr(),
    'Biography'.tr(),
  ];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        spacing: 13.h,
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex = index;
                  });
                },
                child: Categories(
                  isSelected: selectedindex == index,
                  category: categories[index],
                ),
              ),
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(child: CategoriesGridVew()),
        ],
      ),
    );
  }
}
