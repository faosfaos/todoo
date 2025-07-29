import 'package:flutter/material.dart';
import '../abstratcs/o_base_dialog.dart';
import '../../../o_extensions.dart';

//import '../abstratcs/o_base_alert_dialog.dart' show OBaseAlertDialog;
class OButtonStyle {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;
  final double? borderWidth;
  final String? text;
  final bool isBold;

  const OButtonStyle({
    this.backgroundColor,
    this.textColor,
    this.textSize,
    this.isBold = false,
    this.borderColor,
    this.borderWidth,
    this.text,
  });
}

/// Basit dialog yapısı
class ODialogDelete extends OBaseDialog {
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? icon;
  final void Function() confirmButtonPressed;
  final bool closeDialogOnOk;
  final OButtonStyle confirmButtonStyle;
  final OButtonStyle cancelButtonStyle;
  final String? cancelButtonText;
  final String? confirmButtonText;
  final AlignmentGeometry? alignment;
  const ODialogDelete({
    this.title,
    this.alignment,
    this.cancelButtonText,
    this.confirmButtonText,
    this.confirmButtonStyle = const OButtonStyle(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      textSize: null,
      borderColor: null,
      borderWidth: null,
      isBold: true,
    ),
    this.cancelButtonStyle = const OButtonStyle(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      textSize: null,
      borderColor: null,
      borderWidth: null,
      isBold: true,
    ),
    this.closeDialogOnOk = true,
    required this.confirmButtonPressed,
    this.icon,
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
  });
  @override
  Widget? buildTitle(BuildContext context) {
    return title ??
        "- DİKKAT -".oText.color(context.themeErrorColor).bold.make();
  }

  @override
  Widget buildContent(BuildContext context) =>
      content ??
      "Silmek istediğinize emin misiniz?".oText.bold
          .color(context.themePrimaryColor)
          .size(kDefaultFontSize + 4) //14+4
          .center
          .make();
  @override
  Widget? buildIcon(context) {
    return icon ??
        Icon(Icons.info_outline, color: context.themeErrorColor, size: 32);
  }

  @override
  ShapeBorder? buildShape(BuildContext context) {
    if (shape != null) return shape;
    return null;
  }

  @override
  List<Widget>? buildActions(BuildContext context) =>
      actions ??
      [
        //Cancell Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cancelButtonStyle.backgroundColor,
            foregroundColor: cancelButtonStyle.textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: cancelButtonStyle.borderColor ?? Colors.transparent,
                width: cancelButtonStyle.borderWidth ?? 0,
              ),
            ),
            textStyle: TextStyle(
              fontSize: cancelButtonStyle.textSize,
              fontWeight:
                  cancelButtonStyle.isBold
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: (cancelButtonText ?? "Vazgeç").oText.bold.make(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmButtonStyle.backgroundColor,
            foregroundColor: confirmButtonStyle.textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: confirmButtonStyle.borderColor ?? Colors.transparent,
                width: confirmButtonStyle.borderWidth ?? 0,
              ),
            ),
            textStyle: TextStyle(
              fontSize: confirmButtonStyle.textSize,
              fontWeight:
                  confirmButtonStyle.isBold
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          onPressed: () {
            closeDialogOnOk == true ? Navigator.of(context).pop() : null;

            confirmButtonPressed();
          },
          child: (confirmButtonText ?? "SİL").oText.bold.make(),
        ),
      ];

  @override
  AlignmentGeometry? get buildAlignment => alignment ?? super.alignment;
}
