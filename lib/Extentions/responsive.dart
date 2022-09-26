import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultValue, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final w = MediaQuery.of(this).size.width;
    return w >= 1600
      ? (xl ?? lg ?? md ?? sm ?? defaultValue)
      : w >= 1200
        ? (lg ?? md ?? sm ?? defaultValue)
        : w >= 900
          ? (md ?? sm ?? defaultValue)
          : w >= 640
            ? (sm ?? defaultValue)
            : defaultValue;
  }
}