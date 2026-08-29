import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onpressed;
  final String label;
  final TextStyle style;

  const CustomElevatedButton({
    super.key,
    required this.onpressed,
    required this.label,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(label, style: style),
    );
  }
}
