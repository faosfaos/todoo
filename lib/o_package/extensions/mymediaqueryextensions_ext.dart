import 'package:flutter/material.dart';
import '/o_package/o_extensions.dart';

import '../o_decorations/o_shape.dart';
import '../o_extensions_class/o_popup_menu_item.dart';

extension MyMediaQueryExtensions on BuildContext {
  void back<T>([T? result]) {
    if (Navigator.canPop(this)) {
      Navigator.pop(this, result);
    }
  }

  void pop<T>([T? result]) {
    if (Navigator.canPop(this)) {
      Navigator.pop(this, result);
    }
  }

  Color get themePrimaryColor => Theme.of(this).colorScheme.primary;
  Color get themeOnPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get themeSecondryColor => Theme.of(this).colorScheme.secondary;
  Color get themeOnSecondryColor => Theme.of(this).colorScheme.onSecondary;
  Color get themeInversePrimary => Theme.of(this).colorScheme.inversePrimary;
  Color get themeinversePrimaryColor =>
      Theme.of(this).colorScheme.inversePrimary;
  Color get themeErrorColor => Theme.of(this).colorScheme.error;
  Color get themeErrorContainerColor =>
      Theme.of(this).colorScheme.errorContainer;

  /// Ekranın genişliğini döndürür.
  double get screenWidth => MediaQuery.of(this).size.width;
  EdgeInsetsGeometry? get bottomViewInsets =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);
  EdgeInsetsGeometry? get topViewInsets =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.top);
  EdgeInsetsGeometry? get leftViewInsets =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.left);
  EdgeInsetsGeometry? get rightViewInsets =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.right);
  OPopupMenuItem popupMenuItem({
    required String label,
    required VoidCallback onTap,
    Widget? icon,
    TextStyle? textStyle,
    bool iconPositionIsRight = false,
  }) => OPopupMenuItem(
    label: label,
    onTap: onTap,
    icon: icon,
    textStyle: textStyle,
    iconPositionIsRight: iconPositionIsRight,
  );
  Widget myDivider({
    double? height,
    Color? color,
    double? left,
    double? right,
  }) {
    return "".oBox
        .color(color ?? Colors.grey.shade800)
        .size(width: MediaQuery.of(this).size.width, height: height ?? .7)
        .make()
        .pOnly(left: left ?? 8, right: right ?? 8);
  }

  /// Ekranın yüksekliğini döndürür.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Cihazın yönünü döndürür.
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Ekranın kısa kenarını (width veya height) döndürür.
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  /// Ekranın uzun kenarını (width veya height) döndürür.
  double get longestSide => MediaQuery.of(this).size.longestSide;

  /// Cihazın dikey modda olup olmadığını kontrol eder.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Cihazın yatay modda olup olmadığını kontrol eder.
  bool get isLandscape => orientation == Orientation.landscape;

  OShape get oShape => OShape();
}
