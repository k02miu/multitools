import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_item.freezed.dart';

@freezed
class ToolItem with _$ToolItem {
  const factory ToolItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
    // required enum itemId,
  }) = _ToolItem;
}
