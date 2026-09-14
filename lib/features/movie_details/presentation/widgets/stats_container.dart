import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatsContainer extends StatelessWidget {
  final String iconPath;
  final String value;
  const StatsContainer({
    super.key,
    required this.iconPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 47.h,
      width: 122.w,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(iconPath),
          Text(value, style: theme.textTheme.headlineLarge),
        ],
      ),
    );
  }
}
