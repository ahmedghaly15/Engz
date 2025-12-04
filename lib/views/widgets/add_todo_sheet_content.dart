import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../models/form_attributes.dart';
import 'add_todo_form.dart';
import 'assign_new_todo_content_bloc_listener.dart';
import 'inherited_form_attributes.dart';
import 'new_todo_action_row.dart';

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
        children: const [
          AddTodoForm(),
          AssignNewTodoContentBlocListener(),
          NewTodoActionRow(),
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
