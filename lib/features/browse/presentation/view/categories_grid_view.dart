import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/widgets/movie_card.dart';

class CategoriesGridVew extends StatelessWidget {
  const CategoriesGridVew({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 8.h,
      ),
      itemBuilder: (context, index) => MovieCard(),
    );
  }
}