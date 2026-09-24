import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/features/history/presentation/cubit/history_cubit.dart';
import 'package:movies/features/history/presentation/cubit/history_state.dart';

class WatchButton extends StatelessWidget {
  final Movie movie;
  const WatchButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<HistoryCubit, HistoryState>(
      listener: (context, state) {},
      child: CustomElevatedButton(
        onpressed: () {
          context.read<HistoryCubit>().addToHistory(movie);
        },
        backGroundColor: theme.colorScheme.onPrimary,
        child: Text(
          "Watch".tr(),
          style: theme.textTheme.displayMedium!.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
