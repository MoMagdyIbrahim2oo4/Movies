import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onpressed;
  final Widget child ;
  final Color? backGroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onpressed,
    required this.child,
    this.backGroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor
      ),
      child: child ,
    );
  }
}
