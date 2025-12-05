import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo.dart' show CategoryType;

abstract class SelectorCubitBase<S> extends BlocBase<S> {
  SelectorCubitBase(super.initialState);

  CategoryType? get selectedCategory;
  void selectCategory(CategoryType type);
}
