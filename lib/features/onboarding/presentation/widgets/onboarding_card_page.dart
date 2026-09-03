import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import '../../data/models/onboarding_item_model.dart';

class OnboardingCardPage extends StatelessWidget {
  final OnboardingItem item;
  final bool isSecondPage;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingCardPage({
    super.key,
    required this.item,
    required this.isSecondPage,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.titleKey.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge,
            ),
            SizedBox(height: 10.h),
            if (item.descriptionKey != null)
              Text(
                item.descriptionKey!.tr(),
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),

            SizedBox(height: 20.h),

            // Next button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onpressed: onNext,

                backGroundColor: theme.colorScheme.onSecondary,
                child: Text(
                  item.buttonTextKey.tr(),
                  style: theme.textTheme.bodyMedium!,
                ),
              ),
            ),

            // Back button
            if (!isSecondPage) ...[
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onpressed: onBack,

                  backGroundColor: Colors.transparent,
                  side: BorderSide(
                    width: 2,
                    color: theme.colorScheme.onSecondary,
                  ),
                  child: Text(
                    'back'.tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
