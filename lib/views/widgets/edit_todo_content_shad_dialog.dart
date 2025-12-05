import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';
import '../../models/form_attributes.dart';
import '../../models/todo.dart';
import 'inherited_form_attributes.dart';
import 'todo_content_form.dart';

class EditTodoContentShadDialog extends StatefulWidget {
  const EditTodoContentShadDialog({super.key, required Todo todo})
    : _todo = todo;

  final Todo _todo;

  @override
  State<EditTodoContentShadDialog> createState() =>
      _EditTodoContentShadDialogState();
}

class _EditTodoContentShadDialogState extends State<EditTodoContentShadDialog> {
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
      child: ShadDialog(
        closeIcon: const SizedBox.shrink(),
        actionsAxis: .horizontal,
        actionsMainAxisAlignment: .spaceBetween,
        actionsMainAxisSize: MainAxisSize.min, // prevents infinite width
        title: const Text('${AppStrings.edit} ${AppStrings.task}'),
        child: const TodoContentForm(),
        actions: [
          Expanded(
            child: ShadButton.ghost(
              expands: false,
              child: const Text(AppStrings.cancel),
              onPressed: () => context.pop(),
            ),
          ),
          Expanded(child: _editTodoContentButtonBlocListener(context)),
        ],
      ),
    );
  }

  BlocListener<EditTodoCubit, EditTodoState> _editTodoContentButtonBlocListener(
    BuildContext context,
  ) {
    return BlocListener<EditTodoCubit, EditTodoState>(
      listenWhen: (_, current) => current.status.isEditTodoContent,
      listener: (_, state) => _editTodoContentListener(state.status),
      child: PrimaryButton(
        expands: false,
        text: AppStrings.edit,
        onPressed: () => context.read<EditTodoCubit>().editTodoContent(
          description: _descriptionController.text.trim(),
          title: _titleController.text.trim(),
        ),
      ),
    );
  }

  void _editTodoContentListener(EditTodoStatus status) {
    switch (status) {
      case EditTodoStatus.editTodoContent:
        context.pop();
        break;
      default:
        break;
    }
  }

  void _initFormAttributes() {
    _formKey = GlobalKey<ShadFormState>();
    _titleController = TextEditingController(text: widget._todo.title);
    _descriptionController = TextEditingController(
      text: widget._todo.description,
    );
  }

  void _disposeControllers() {
    _titleController.dispose();
    _descriptionController.dispose();
  }
}
