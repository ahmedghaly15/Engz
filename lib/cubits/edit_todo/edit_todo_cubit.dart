import '../../models/todo.dart';
import '../selector/selector_cubit.dart';
import 'edit_todo_state.dart';

class EditTodoCubit extends SelectorCubitBase<EditTodoState> {
  EditTodoCubit() : super(EditTodoState.initial());

  void initTodo(Todo todo) =>
      emit(state.copyWith(todo: todo, status: EditTodoStatus.initTodo));

  void editTodoContent({String? title, String? description}) {
    final oldTodo = state.todo;
    emit(
      state.copyWith(
        todo: state.todo!.copyWith(
          title: title ?? oldTodo?.title,
          description: description ?? oldTodo?.description,
        ),
        status: EditTodoStatus.editTodoContent,
      ),
    );
  }

  @override
  CategoryType? get selectedCategory => state.todo!.category;

  @override
  void selectCategory(CategoryType type) {
    if (state.todo!.category != type) {
      emit(
        state.copyWith(
          todo: state.todo!.copyWith(category: type),
          status: EditTodoStatus.editTodoCategory,
        ),
      );
    }
  }
}
