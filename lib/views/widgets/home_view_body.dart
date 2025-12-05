import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/custom_input_form_field.dart';
import 'completed_todos_title_card_bloc_selector.dart';
import 'filtered_todos_sliver_list_bloc_selector.dart';
import 'inherited_scroll_controller.dart';

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
            sliver: SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  // TODO: handle search via => showSearch()
                },
                child: CustomInputFormField(
                  placeholderText: AppStrings.searchForYourTask,
                  leading: SvgPicture.asset(Assets.svgsSearchIcon),
                ),
              ),
            ),
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
