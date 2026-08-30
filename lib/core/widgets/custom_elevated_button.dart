import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onpressed;
  final String label;
  final TextStyle style;
  final Color? backGroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onpressed,
    required this.label,
    required this.style,
    this.backGroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor
      ),
      child: Text(label, style: style),
    );
  }
}
