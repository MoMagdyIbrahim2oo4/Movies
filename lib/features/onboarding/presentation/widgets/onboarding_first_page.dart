import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import '../../data/models/onboarding_item_model.dart';

class OnboardingFirstPage extends StatelessWidget {
  final OnboardingItem item;
  final VoidCallback onNext;

  const OnboardingFirstPage({
    super.key,
    required this.item,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 33.h, left: 16.w, right: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.titleKey.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              item.descriptionKey!.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium!.copyWith(
                color: theme.colorScheme.secondary.withValues(alpha: .6),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onpressed: onNext,
                child: Text(
                  item.buttonTextKey.tr(),
                  style: theme.textTheme.bodyMedium!,
                ),

                backGroundColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
