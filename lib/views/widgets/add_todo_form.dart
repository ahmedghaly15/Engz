import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/input_validator.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_input_form_field.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import 'inherited_form_attributes.dart';

class AddTodoForm extends StatelessWidget {
  const AddTodoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formAttributes = InheritedFormAttributes.of(context);
    return ShadForm(
      key: formAttributes.formKey,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 13.h,
        children: [
          CustomInputFormField(
            autofocus: true,
            controller: formAttributes.titleController,
            placeholderText: AppStrings.title,
            validator: (value) => InputValidator.validateField(value),
            onChanged: (value) {
              context.read<NewTodoCubit>().assignNewTodoContent(title: value);
              formAttributes.titleController.text = value;
            },
          ),
          CustomInputFormField(
            controller: formAttributes.descriptionController,
            placeholderText: AppStrings.description,
            maxLines: 2,
            validator: (value) => InputValidator.validateField(value),
            onChanged: (value) {
              context.read<NewTodoCubit>().assignNewTodoContent(
                description: value,
              );
              formAttributes.descriptionController.text = value;
            },
          ),
        ],
      ),
    );
  }
}
