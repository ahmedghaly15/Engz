import '../core/enums/todo_action.dart';
import 'todo.dart';

class EditTodoPopAttributes {
  final TodoAction action;
  final Todo todo;

  EditTodoPopAttributes({required this.action, required this.todo});
}
