import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '/o_package/o_extensions.dart';

import '../abstratcs/o_base_dialog.dart' show OBaseDialog;
import 'o_dialog_delete.dart';

/// Form içeren özel dialog
class ODialogForm extends OBaseDialog {
  final List<Widget> formItems;
  final List<Widget> topWidgets;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double height;
  final List<Widget>? actions;
  final void Function(GlobalKey<FormBuilderState> formKey) confirmButtonPressed;
  final bool closeDialogWhenConfirmButtonClicks;
  final OButtonStyle confirmButton;
  final OButtonStyle cancelButton;
  //final String? cancelButtonText;
  //final String? confirmButtonText;
  final AlignmentGeometry? alignment;
  static final _formKey = GlobalKey<FormBuilderState>();

  const ODialogForm({
    super.title,
    this.alignment,
    //this.cancelButtonText,
    //this.confirmButtonText,
    this.confirmButton = const OButtonStyle(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      textSize: 16,
      isBold: true,
    ),
    this.cancelButton = const OButtonStyle(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      textSize: 16,
      isBold: true,
    ),
    this.closeDialogWhenConfirmButtonClicks = true,
    required this.confirmButtonPressed,
    this.actions,
    required this.formItems,
    this.topWidgets = const [],
    this.height = 300,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
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
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...topWidgets,
        SizedBox(
          width: double.maxFinite,
          height: height,
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: MainAxisSize.min,
                children: formItems,
              ),
            ),
          ),
        ),
      ],
    ).oScrollV.padding(context.bottomViewInsets).make();
  }

  /* @override
  ShapeBorder? buildShape(BuildContext context) {
    return shapeDialog(context);
  } */

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Color defaultColor = Theme.of(context).colorScheme.onPrimary;
    return actions ??
        [
          //Cancel
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cancelButton.backgroundColor ?? Colors.green,
              foregroundColor: cancelButton.textColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: cancelButton.borderColor ?? Colors.transparent,
                  width: cancelButton.borderWidth ?? 0,
                ),
              ),
              textStyle: TextStyle(
                fontSize: cancelButton.textSize,
                fontWeight:
                    cancelButton.isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: (cancelButton.text ?? "Vazgeç").oText.bold.make(),
          ),
          //Confirm
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmButton.backgroundColor ?? Colors.red,
              foregroundColor: confirmButton.textColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: confirmButton.borderColor ?? Colors.transparent,
                  width: confirmButton.borderWidth ?? 0,
                ),
              ),
              textStyle: TextStyle(
                fontSize: confirmButton.textSize,
                fontWeight:
                    confirmButton.isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                closeDialogWhenConfirmButtonClicks == true
                    ? Navigator.of(context).pop()
                    : null;
                //var formData = _formKey.currentState?.value;
                confirmButtonPressed(_formKey);
              }
            },
            child: (confirmButton.text ?? "TAMAM").oText.bold.make(),
          ),
        ];
  }

  @override
  AlignmentGeometry? get buildAlignment => alignment ?? super.alignment;
}
