import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_strings.dart';
import '../cubits/home/todo_cubit.dart';
import '../cubits/home/todo_state.dart';
import 'widgets/empty_todos.dart';
import 'widgets/inherited_scroll_controller.dart';
import 'widgets/todos_sliver_list_bloc_selector.dart';
import 'widgets/todos_title_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InheritedScrollController(
        scrollController: _scrollController,
        child: SafeArea(
          child: Padding(
            padding: .symmetric(vertical: 16.h, horizontal: 24.w),
            child: BlocSelector<TodoCubit, TodoState, bool>(
              selector: (state) => state.todos.isNotEmpty,
              builder: (context, isNotEmpty) {
                return isNotEmpty
                    ? CustomScrollView(
                        controller: _scrollController,
                        slivers: const [
                          TodosSliverListBlocSelector(),
                          SliverToBoxAdapter(
                            child: TodosTitleCard(title: AppStrings.completed),
                          ),
                          TodosSliverListBlocSelector(
                            filter: TodoFilter.completed,
                          ),
                        ],
                      )
                    : Padding(
                        padding: .symmetric(horizontal: 40.w),
                        child: const EmptyTodos(),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
