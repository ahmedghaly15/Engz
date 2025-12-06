import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../helpers/extensions.dart';
import '../utils/app_strings.dart';

class CancelTextButton extends StatelessWidget {
  const CancelTextButton({super.key, ShadButtonSize? size}) : _size = size;

  final ShadButtonSize? _size;

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      expands: false,
      size: _size,
      child: const Text(AppStrings.cancel),
      onPressed: () => context.pop(),
    );
  }
}
