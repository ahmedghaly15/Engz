import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import 'responsive_new_todo_category_grid_view.dart';

class ShowNewTodoCategorySelectorIconButton extends StatelessWidget {
  const ShowNewTodoCategorySelectorIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.showShadCnDialog(
        (_) => BlocProvider<NewTodoCubit>.value(
          value: context.read<NewTodoCubit>(),
          child: ShadDialog(
            closeIcon: const SizedBox.shrink(),
            title: const Text(AppStrings.chooseCategory),
            child: const ResponsiveNewTodoCategoryGridView(),
            actions: [
              PrimaryButton(
                onPressed: () => context.showComingSoonDialog(),
                text: AppStrings.addCategory,
              ),
            ],
          ),
        ),
      ),
      icon: const Icon(LucideIcons.layoutGrid),
    );
  }
}
