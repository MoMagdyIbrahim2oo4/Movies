import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SummarySection extends StatelessWidget {
  final String summary;
  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    if (summary.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16.h,
      children: [
        Text("summary".tr(), style: theme.textTheme.headlineLarge),
        Text(
          summary,
          style: theme.textTheme.labelSmall!.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
