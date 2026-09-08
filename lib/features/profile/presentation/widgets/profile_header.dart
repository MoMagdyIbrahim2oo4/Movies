import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatarPath;
  final int wishListCount;
  final int historyCount;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.avatarPath,
    required this.wishListCount,
    required this.historyCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              spacing: 15.h,
              children: [
                SizedBox(
                  width: 118.w,
                  height: 118.h,
                  child: Image.asset(avatarPath, fit: BoxFit.cover),
                ),
                Text(
                  name,
                  style: theme.textTheme.headlineLarge!.copyWith(fontSize: 20),
                ),
              ],
            ),
            _StatColumn(count: wishListCount, label: 'wishlist'.tr()),
            _StatColumn(count: historyCount, label: 'history'.tr()),
          ],
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  final int count;
  final String label;

  const _StatColumn({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      spacing: 20.h,
      children: [
        Text(
          '$count',
          style: theme.textTheme.headlineLarge?.copyWith(fontSize: 36),
        ),
        Text(label, style: theme.textTheme.headlineLarge),
      ],
    );
  }
}
