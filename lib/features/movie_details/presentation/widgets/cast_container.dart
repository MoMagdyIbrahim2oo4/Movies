import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../data/models/movie_details_response.dart';

class CastContainer extends StatelessWidget {
  const CastContainer({super.key, required this.castMember});
  final Cast castMember;
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
              child: castMember.urlSmallImage != null
                  ? CachedNetworkImage(
                      imageUrl: castMember.urlSmallImage!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: theme.colorScheme.surface,
                      child: const Icon(Icons.person),
                    ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name : ${castMember.name}",
                  style: theme.textTheme.labelMedium,
                ),
                Text(
                  "Character : ${castMember.characterName}",
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
