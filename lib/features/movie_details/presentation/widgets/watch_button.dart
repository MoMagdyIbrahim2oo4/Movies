import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';

class WatchButton extends StatelessWidget {
  const WatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomElevatedButton(
      onpressed: () {},
      backGroundColor: theme.colorScheme.onPrimary,
      child: Text(
        "Watch".tr(),
        style: theme.textTheme.displayMedium!.copyWith(
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  }
}
