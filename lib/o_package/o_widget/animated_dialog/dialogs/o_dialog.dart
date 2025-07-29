import 'package:flutter/material.dart';

import '../abstratcs/o_base_dialog.dart' show OBaseDialog;

/// Basit dialog yapısı
class ODialog extends OBaseDialog {
  final Widget? content;
  final List<Widget>? actions;
  final AlignmentGeometry? alignment;

  const ODialog({
    super.title,
    this.content,
    this.actions,
    super.animationDuration,
    super.animationCurve,
    super.animationDirection,
    super.barrierDismissible,
    super.barrierColor,
    super.shape,
    super.backgroundColor,
    super.elevation,
    super.lottie,
    super.lottieSize,
    super.lottieBorderColor,
    super.lottieBackgroundColor,
    super.lottieBorderWidth,
    super.lottieRadius,
    super.animationReverseExit,
    this.alignment,
  });

  @override
  Widget buildContent(BuildContext context) =>
      content ?? const SizedBox.shrink();

  @override
  List<Widget>? buildActions(BuildContext context) => actions;

  @override
  AlignmentGeometry? get buildAlignment => alignment ?? super.alignment;
}
