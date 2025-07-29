import 'package:flutter/material.dart';

import '../enums.dart';

/// Giriş/Çıkış animasyonu için mixin
mixin OAnimationMixin {
  Offset getAnimationOffset(
    AnimationDirection direction, {
    bool reverse = false,
  }) {
    switch (direction) {
      case AnimationDirection.bottomToTop:
        return Offset(0, reverse ? -1 : 1);
      case AnimationDirection.rightToLeft:
        return Offset(reverse ? -1 : 1, 0);
      case AnimationDirection.leftToRight:
        return Offset(reverse ? 1 : -1, 0);
      case AnimationDirection.topToBottom:
        return Offset(0, reverse ? 1 : -1);
    }
  }

  SlideTransition buildSlideTransition({
    required Animation<double> animation,
    required Widget child,
    required AnimationDirection direction,
    required Curve curve,
    required bool reverseExit,
  }) {
    final curved = CurvedAnimation(parent: animation, curve: curve);
    final begin = getAnimationOffset(
      direction,
      reverse: reverseExit && animation.status == AnimationStatus.reverse,
    );
    final tween = Tween<Offset>(begin: begin, end: Offset.zero);
    return SlideTransition(position: tween.animate(curved), child: child);
  }
}
