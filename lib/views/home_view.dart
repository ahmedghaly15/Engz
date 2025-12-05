import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../core/utils/app_strings.dart';
import '../core/utils/assets.dart';
import '../core/widgets/custom_input_form_field.dart';
import '../cubits/home/todo_cubit.dart';
import '../cubits/home/todo_state.dart';
import 'widgets/add_todo_fab.dart';
import 'widgets/empty_todos.dart';
import 'widgets/inherited_scroll_controller.dart';
import 'widgets/filtered_todos_sliver_list_bloc_selector.dart';
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
                        slivers: [
                          SliverPadding(
                            padding: .only(bottom: 20.h),
                            sliver: SliverToBoxAdapter(
                              child: GestureDetector(
                                onTap: () {
                                  // TODO: handle search via => showSearch()
                                },
                                child: CustomInputFormField(
                                  placeholderText: AppStrings.searchForYourTask,
                                  leading: SvgPicture.asset(
                                    Assets.svgsSearchIcon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const FilteredTodosSliverListBlocSelector(),
                          SliverPadding(
                            padding: .symmetric(vertical: 24.h),
                            sliver: const SliverToBoxAdapter(
                              child: TodosTitleCard(
                                title: AppStrings.completed,
                              ),
                            ),
                          ),
                          const FilteredTodosSliverListBlocSelector(
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
      floatingActionButton: const AddTodoFAB(),
    );
  }
}
