import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ScreenshotsSection extends StatelessWidget {
  final List<String> screenshotUrls;
  const ScreenshotsSection({super.key, required this.screenshotUrls});

  @override
  Widget build(BuildContext context) {
    if (screenshotUrls.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 13.h,
      children: [
        Text("screenShots".tr(), style: theme.textTheme.headlineLarge),
        for (final url in screenshotUrls)
          SizedBox(
            width: double.infinity,
            height: 167.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
            ),
          ),
      ],
    );
  }
}
