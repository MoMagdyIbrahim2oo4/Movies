import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';

class ProfileTabBar extends StatelessWidget {
  final TabController tabController;

  const ProfileTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tabsData = [
      (icon: AppIcons.watchListIcon, label: 'watch_list'.tr()),
      (icon: AppIcons.historyIcon, label: 'history'.tr()),
    ];

    return Container(
      color: theme.colorScheme.surface,
      child: TabBar(
        controller: tabController,
        indicatorColor: theme.colorScheme.onSecondary,
        indicatorWeight: 3.h,
        tabs: tabsData
            .map(
              (t) => Tab(
                height: 90.h,
                child: _TabLabel(iconPath: t.icon, label: t.label),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  final String iconPath;
  final String label;

  const _TabLabel({required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSecondary,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 6.h),
        Text(label, style: theme.textTheme.labelMedium),
      ],
    );
  }
}
