import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../data/models/category_model.dart';
import 'categories.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategoryId;
  final void Function(CategoryModel category) onCategorySelected;

  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.genrsId == selectedCategoryId;

          return GestureDetector(
            onTap: () {
              if (!isSelected) {
                onCategorySelected(category);
              }
            },
            child: Categories(
              isSelected: isSelected,
              category: category,
            ),
          );
        },
      ),
    );
  }
}
