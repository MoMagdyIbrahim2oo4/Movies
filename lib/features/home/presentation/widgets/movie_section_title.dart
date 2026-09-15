import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/widgets/custom_text_button.dart';

class MovieSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;

  const MovieSectionTitle({super.key, required this.title, this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelMedium),
          if (onSeeMore != null)
            CustomTextButton(
              onPressed: onSeeMore!,
              text: 'See More →',
              style: theme.textTheme.labelSmall,
            ),
        ],
      ),
    );
  }
}
