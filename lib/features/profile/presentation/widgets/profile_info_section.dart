import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'profile_header.dart';
import 'profile_action_buttons.dart';

class ProfileInfoSection extends StatelessWidget {
  final String name;
  final String avatarPath;
  final int wishListCount;
  final int historyCount;
  final VoidCallback onEditProfile;
  final VoidCallback onExit;

  const ProfileInfoSection({
    super.key,
    required this.name,
    required this.avatarPath,
    required this.wishListCount,
    required this.historyCount,
    required this.onEditProfile,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(top: 52.h),
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 23.h,
          children: [
            ProfileHeader(
              name: name,
              avatarPath: avatarPath,
              wishListCount: wishListCount,
              historyCount: historyCount,
            ),
            ProfileActionButtons(onEditProfile: onEditProfile, onExit: onExit),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
