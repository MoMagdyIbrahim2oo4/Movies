import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/wishlist/cubit/wishlist_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.movie});
  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<WishlistCubit, WishlistState>(
      buildWhen: (prev, curr) =>
          prev.isSaved(movie.id) != curr.isSaved(movie.id),
      builder: (context, state) {
        final isSaved = state.isSaved(movie.id);
        return IconButton(
          onPressed: () => context.read<WishlistCubit>().toggleWishlist(movie),
          icon: SvgPicture.asset(
            AppIcons.saveIcon,
            colorFilter: ColorFilter.mode(
              isSaved
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
