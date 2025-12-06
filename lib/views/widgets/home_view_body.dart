import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'completed_todos_title_card_bloc_selector.dart';
import 'filtered_todos_sliver_list_bloc_selector.dart';
import 'inherited_scroll_controller.dart';
import 'search_input_form_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
    return InheritedScrollController(
      scrollController: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: .only(bottom: 20.h),
            sliver: const SliverToBoxAdapter(child: SearchInputFormField()),
          ),
          const FilteredTodosSliverListBlocSelector(),
          const CompletedTodosTitleCardBlocSelector(),
          const FilteredTodosSliverListBlocSelector(
            filter: TodoFilter.completed,
          ),
        ],
      ),
    );
  }
}
