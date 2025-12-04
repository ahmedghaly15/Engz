import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/di/di.dart';
import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';
import '../utils/fade_scale_transition_builder.dart';
import 'responsive_new_todo_category_grid_view.dart';
import 'responsive_new_todo_priority_grid_view.dart';

class NewTodoActionRow extends StatelessWidget {
  const NewTodoActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        _datePickerIconButton(context),
        _categoriesGridViewIconButton(context),
        _prioritiesIconButton(context),
        const Spacer(),
        _addNewTodoIconButton(),
      ],
    );
  }

  BlocSelector<NewTodoCubit, NewTodoState, bool> _addNewTodoIconButton() {
    return BlocSelector<NewTodoCubit, NewTodoState, bool>(
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
    );
  }

  IconButton _prioritiesIconButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.showShadCnDialog(
        (_) => BlocProvider<NewTodoCubit>.value(
          value: getIt<NewTodoCubit>(),
          child: const ShadDialog(
            constraints: BoxConstraints(maxWidth: 327, maxHeight: 600),
            title: Text(AppStrings.taskPriority),
            child: ResponsiveNewTodoPriorityGridView(),
          ),
        ),
      ),
      icon: const Icon(LucideIcons.flag),
    );
  }

  IconButton _categoriesGridViewIconButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.showShadCnDialog(
        (_) => BlocProvider<NewTodoCubit>.value(
          value: getIt<NewTodoCubit>(),
          child: ShadDialog(
            title: const Text(AppStrings.chooseCategory),
            child: const ResponsiveNewTodoCategoryGridView(),
            actions: [
              PrimaryButton(onPressed: () {}, text: AppStrings.addCategory),
            ],
          ),
        ),
      ),
      icon: const Icon(LucideIcons.layoutGrid),
    );
  }

  IconButton _datePickerIconButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.showDatePicker(
        (dateTime) => context.read<NewTodoCubit>().assignDate(dateTime),
      ),
      icon: const Icon(LucideIcons.calendar),
    );
  }
}
