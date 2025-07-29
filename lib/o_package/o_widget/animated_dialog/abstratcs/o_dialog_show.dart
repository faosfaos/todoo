import 'package:flutter/material.dart';

/// Soyut yapı
abstract class ODialogShow {
  Future<T?> show<T>(BuildContext context);
}
