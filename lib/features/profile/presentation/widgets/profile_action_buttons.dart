import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';

class ProfileActionButtons extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onExit;

  const ProfileActionButtons({
    super.key,
    required this.onEditProfile,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomElevatedButton(
            onpressed: onEditProfile,
            child: Text('edit_profile'.tr(), style: theme.textTheme.labelLarge),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 2,
          child: CustomElevatedButton(
            backGroundColor: theme.colorScheme.onPrimary,
            onpressed: onExit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.w,
              children: [
                Text('exit'.tr(), style: theme.textTheme.labelMedium),
                SvgPicture.asset(AppIcons.exitIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
