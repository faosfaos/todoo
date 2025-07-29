import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../enums.dart';

import '../mixins/o_animation_mixin.dart';
import '../mixins/o_shape_mixin.dart';
import 'o_dialog_show.dart';

/// Ortak yapı
abstract class OBaseDialog
    with OAnimationMixin, OShapeMixin
    implements ODialogShow {
  final Widget? title;
  final Duration animationDuration;
  final Curve animationCurve;
  final AnimationDirection animationDirection;
  final bool barrierDismissible;
  final Color barrierColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final double? elevation;
  final bool scrollable;
  final LottieImage? lottie;
  final double lottieSize;
  final Color lottieBorderColor;
  final Color lottieBackgroundColor;
  final double lottieBorderWidth;
  final double lottieRadius;
  final bool animationReverseExit;
  final AlignmentGeometry? alignment;

  const OBaseDialog({
    this.title,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeOutBack,
    this.animationDirection = AnimationDirection.bottomToTop,
    this.barrierDismissible = true,
    this.barrierColor = const Color(0x80000000),
    this.shape,
    this.backgroundColor,
    this.elevation,
    this.scrollable = false,
    this.lottie,
    this.lottieSize = 150,
    this.lottieBorderColor = Colors.orange,
    this.lottieBackgroundColor = Colors.white,
    this.lottieBorderWidth = 3,
    this.lottieRadius = 30,
    this.animationReverseExit = false,
    this.alignment,
  });

  Widget? buildTitle(BuildContext context) => title;
  Widget? buildIcon(BuildContext context) => null;
  Widget buildContent(BuildContext context);
  AlignmentGeometry? get buildAlignment;
  Widget? buildLottieIcon(BuildContext context) {
    if (lottie == null) return buildIcon(context);
    return Container(
      width: lottieSize,
      height: lottieSize,
      decoration: BoxDecoration(
        color: lottieBackgroundColor,
        border: Border.all(color: lottieBorderColor, width: lottieBorderWidth),
        borderRadius: BorderRadius.circular(lottieRadius),
      ),
      child: Lottie.asset("assets/images/${lottie!.name}.json"),
    );
  }

  List<Widget>? buildActions(BuildContext context);

  @override
  Future<T?> show<T>(BuildContext context) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: animationDuration,
      pageBuilder: (context, anim1, anim2) {
        return PopScope(
          canPop: barrierDismissible,
          child: AlertDialog(
            alignment: alignment,
            title: buildTitle(context),
            icon: buildLottieIcon(context),
            backgroundColor: backgroundColor,
            shape: buildShape(context) ?? shape,
            elevation: elevation,
            content: SizedBox(
              width: double.maxFinite,
              child: buildContent(context),
            ),
            actions: buildActions(context),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return buildSlideTransition(
          animation: anim1,
          child: child,
          direction: animationDirection,
          curve: animationCurve,
          reverseExit: animationReverseExit,
        );
      },
    );
  }
}
