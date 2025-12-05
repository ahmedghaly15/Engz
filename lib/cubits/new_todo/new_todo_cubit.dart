import '../../models/todo.dart' show CategoryType;
import '../selector/selector_cubit.dart';
import 'new_todo_state.dart';

class NewTodoCubit extends SelectorCubitBase<NewTodoState> {
  NewTodoCubit() : super(NewTodoState.initial());

  void assignNewTodoContent({String? title, String? description}) {
    final oldTitle = state.todo!.title;
    final oldDescription = state.todo!.description;
    emit(
      state.copyWith(
        todo: state.todo!.copyWith(
          title: title ?? oldTitle,
          description: description ?? oldDescription,
        ),
        status: NewTodoStatus.assignNewTodoContent,
      ),
    );
  }

  void toggleSendButton() {
    final todo = state.todo;
    emit(
      state.copyWith(
        isSendButtonEnabled:
            todo!.title!.isNotEmpty && todo.description!.isNotEmpty,
        status: NewTodoStatus.toggleSendButton,
      ),
    );
  }

  void assignDate(DateTime? dateTime) => emit(
    state.copyWith(
      todo: state.todo!.copyWith(dateTime: dateTime),
      status: NewTodoStatus.updateDate,
    ),
  );

  @override
  CategoryType? get selectedCategory => state.todo!.category;

  @override
  void selectCategory(CategoryType type) {
    if (state.todo!.category != type) {
      emit(
        state.copyWith(
          todo: state.todo!.copyWith(category: type),
          status: NewTodoStatus.selectCategory,
        ),
      );
    }
  }

  @override
  int? get selectedPriority => state.todo!.priority;

  @override
  void selectPriority(int priority) {
    if (state.todo!.priority != priority) {
      emit(
        state.copyWith(
          todo: state.todo!.copyWith(priority: priority),
          status: NewTodoStatus.selectPriority,
        ),
      );
    }
  }
}
