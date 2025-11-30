import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'form_attributes.freezed.dart';

@freezed
sealed class FormAttributes with _$FormAttributes {
  const factory FormAttributes({
    required GlobalKey<ShadFormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
  }) = _FormAttributes;
}
