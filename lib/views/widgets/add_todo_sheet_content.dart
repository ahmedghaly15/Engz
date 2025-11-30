import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/utils/assets.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';
import '../../models/form_attributes.dart';
import '../utils/fade_scale_transition_builder.dart';
import 'add_todo_form.dart';
import 'assign_new_todo_content_bloc_listener.dart';
import 'inherited_form_attributes.dart';

class AddTodoSheetContent extends StatefulWidget {
  const AddTodoSheetContent({super.key});

  @override
  State<AddTodoSheetContent> createState() => _AddTodoSheetContentState();
}

class _AddTodoSheetContentState extends State<AddTodoSheetContent> {
  late final GlobalKey<ShadFormState> _formKey;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _initFormAttributes();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedFormAttributes(
      formAttributes: FormAttributes(
        formKey: _formKey,
        titleController: _titleController,
        descriptionController: _descriptionController,
      ),
      child: Column(
        spacing: 16.h,
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          const AddTodoForm(),
          const AssignNewTodoContentBlocListener(),
          Row(
            mainAxisAlignment: .start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.calendar),
              ),
              IconButton(onPressed: () {}, icon: const Icon(LucideIcons.clock)),
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
          ),
        ],
      ),
    );
  }

  void _initFormAttributes() {
    _formKey = GlobalKey<ShadFormState>();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  void _disposeControllers() {
    _titleController.dispose();
    _descriptionController.dispose();
  }
}
