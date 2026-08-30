import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AvatarHolder extends StatelessWidget {
  final String avatar;
  final bool isSelected;

  const AvatarHolder({super.key, required this.avatar,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(vertical: 9.h,horizontal: 13.w),
      decoration: BoxDecoration(
        color: isSelected?Theme.of(context).colorScheme.onError:Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(20.r),
        border: BoxBorder.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Image.asset(avatar),
    );
  }
}
