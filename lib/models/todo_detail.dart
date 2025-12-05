import 'package:flutter/material.dart';

class TodoDetailItem {
  final IconData detailIcon;
  final String detailTitle;
  final Widget detailContent;

  TodoDetailItem({
    required this.detailIcon,
    required this.detailTitle,
    required this.detailContent,
  });
}
