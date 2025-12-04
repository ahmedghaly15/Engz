import 'package:flutter/material.dart';

import 'add_todo_bloc_listener.dart';
import 'add_todo_icon_button_bloc_selector.dart';
import 'show_new_todo_category_selector_icon_button.dart';
import 'show_new_todo_date_picker_icon_button.dart';
import 'show_new_todo_priority_selector_icon_button.dart';

class NewTodoActionRow extends StatelessWidget {
  const NewTodoActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: .start,
      children: [
        ShowNewTodoDatePickerIconButton(),
        ShowNewTodoCategorySelectorIconButton(),
        ShowNewTodoPrioritySelectorIconButton(),
        AddTodoBlocListener(),
        Spacer(),
        AddTodoIconButtonBlocSelector(),
      ],
    );
  }
}
