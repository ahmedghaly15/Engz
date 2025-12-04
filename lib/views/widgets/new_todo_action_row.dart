import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';
import '../utils/fade_scale_transition_builder.dart';
import 'responsive_categories_grid_view.dart';

class NewTodoActionRow extends StatelessWidget {
  const NewTodoActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        IconButton(
          onPressed: () => context.showDatePicker(
            (dateTime) => context.read<NewTodoCubit>().assignDate(dateTime),
          ),
          icon: const Icon(LucideIcons.calendar),
        ),
        IconButton(
          onPressed: () => context.showDialog(
            titleText: AppStrings.chooseCategory,
            child: const ResponsiveCategoriesGridView(),
            actions: [
              PrimaryButton(onPressed: () {}, text: AppStrings.addCategory),
            ],
          ),
          icon: const Icon(LucideIcons.layoutGrid),
        ),
        IconButton(onPressed: () {}, icon: const Icon(LucideIcons.flag)),
        const Spacer(),
        BlocSelector<NewTodoCubit, NewTodoState, bool>(
          selector: (state) => state.isSendButtonEnabled,
          builder: (_, isSendButtonEnabled) => IconButton(
            onPressed: isSendButtonEnabled ? () {} : null,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: fadeScaleTransitionBuilder,
              child: SvgPicture.asset(
                key: ValueKey(isSendButtonEnabled),
                isSendButtonEnabled
                    ? Assets.svgsPrimarySendIcon
                    : Assets.svgsWhiteSendIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
