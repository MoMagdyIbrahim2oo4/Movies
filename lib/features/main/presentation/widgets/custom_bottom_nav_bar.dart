import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_Icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 33.w),
      margin: EdgeInsets.only(bottom: 9.h, right: 8.w, left: 9.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(context, index: 0, iconPath: AppIcons.homeIcon),
          _navItem(context, index: 1, iconPath: AppIcons.searchIcon),
          _navItem(context, index: 2, iconPath: AppIcons.browseIcon),
          _navItem(context, index: 3, iconPath: AppIcons.profileIcon),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required int index,
    required String iconPath,
  }) {
    final bool isSelected = selectedIndex == index;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected
              ? theme.colorScheme.onSecondary
              : theme.colorScheme.secondary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
