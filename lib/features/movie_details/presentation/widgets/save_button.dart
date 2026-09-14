import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_Icons.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () => setState(() => _isSaved = !_isSaved),
      icon: SvgPicture.asset(
        AppIcons.saveIcon,
        colorFilter: ColorFilter.mode(
          _isSaved
              ? theme.colorScheme.onSecondary
              : theme.colorScheme.secondary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
