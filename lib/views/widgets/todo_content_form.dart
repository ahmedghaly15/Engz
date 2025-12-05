import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/input_validator.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_input_form_field.dart';
import 'inherited_form_attributes.dart';

class TodoContentForm extends StatelessWidget {
  const TodoContentForm({
    super.key,
    void Function(String)? titleFieldOnChanged,
    void Function(String)? descriptionFieldOnChanged,
  }) : _titleFieldOnChanged = titleFieldOnChanged,
       _descriptionFieldOnChanged = descriptionFieldOnChanged;

  final void Function(String)? _titleFieldOnChanged, _descriptionFieldOnChanged;

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
              if (_titleFieldOnChanged != null) {
                _titleFieldOnChanged(value);
              }
              formAttributes.titleController.text = value;
            },
          ),
          CustomInputFormField(
            controller: formAttributes.descriptionController,
            placeholderText: AppStrings.description,
            maxLines: 2,
            validator: (value) => InputValidator.validateField(value),
            onChanged: (value) {
              if (_descriptionFieldOnChanged != null) {
                _descriptionFieldOnChanged(value);
              }
              formAttributes.descriptionController.text = value;
            },
            maxLength: null,
          ),
        ],
      ),
    );
  }
}
