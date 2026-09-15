import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CastContainer extends StatelessWidget {
  final String castImagePath;
  final String castName;
  final String castCharacter;
  const CastContainer({
    super.key,
    required this.castImagePath,
    required this.castName,
    required this.castCharacter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(11),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          SizedBox(
            width: 70.w,
            height: 70.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: castImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name : $castName", style: theme.textTheme.labelMedium),
                Text(
                  "Character : $castCharacter",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
