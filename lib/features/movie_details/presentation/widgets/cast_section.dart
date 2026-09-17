import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/presentation/widgets/cast_container.dart';

import '../../data/models/movie_details_response.dart';

class CastSection extends StatelessWidget {
  final List<Cast> cast;
  const CastSection({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8.h,
      children: [
        Text("cast".tr(), style: theme.textTheme.headlineLarge),
        for (final member in cast) CastContainer(castMember: member),
      ],
    );
  }
}
