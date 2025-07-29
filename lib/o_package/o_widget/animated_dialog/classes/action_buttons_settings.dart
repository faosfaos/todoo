import 'package:flutter/material.dart';

/// Aksiyon butonlarını tanımlayan model
class ActionButtonsSetting {
  final String cancelText;
  final String confirmText;
  final TextStyle? cancelTextStyle;
  final TextStyle? confirmTextStyle;
  final Color? confirmBackgroundColor;
  final Color? cancelBackgroundColor;

  const ActionButtonsSetting({
    this.cancelText = "Vazgeç",
    this.confirmText = "Tamam",
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.confirmBackgroundColor,
    this.cancelBackgroundColor,
  });
}
