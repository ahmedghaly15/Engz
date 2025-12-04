import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/extensions.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/home/todo_state.dart';

class AddTodoBlocListener extends StatelessWidget {
  const AddTodoBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoCubit, TodoState>(
      listenWhen: (_, current) => current.status == TodoStatus.addTodo,
      listener: (_, state) {
        switch (state.status) {
          case TodoStatus.addTodo:
            context.pop();
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
