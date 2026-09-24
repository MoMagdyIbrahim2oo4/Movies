import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/features/browse/data/models/category_model.dart';

class Categories extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  const Categories({
    super.key,
    required this.isSelected,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.onSecondary
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Text(
        category.categoryName,
        style: isSelected
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
