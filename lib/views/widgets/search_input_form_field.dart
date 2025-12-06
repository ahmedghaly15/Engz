import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/custom_input_form_field.dart';

class SearchInputFormField extends StatelessWidget {
  const SearchInputFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.showComingSoonDialog();
        // TODO: handle search via => showSearch()
      },
      child: CustomInputFormField(
        enabled: false,
        placeholderText: AppStrings.searchForYourTask,
        leading: SvgPicture.asset(Assets.svgsSearchIcon),
      ),
    );
  }
}
