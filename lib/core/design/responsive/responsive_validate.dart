import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? watch,
  }) {
    final double deviceWidth = MediaQuery.of(this).size.shortestSide;

    if (isDesktop) {
      final double fullWidth = MediaQuery.of(this).size.width;
      if (fullWidth >= 1200 && desktop != null) {
        return desktop;
      }
    }

    if (deviceWidth >= 1200 && desktop != null) {
      return desktop;
    } else if (deviceWidth >= 600 && tablet != null) {
      return tablet;
    } else if (deviceWidth < 300 && watch != null) {
      return watch;
    } else {
      return mobile;
    }
  }

  bool get isDesktop {
    final TargetPlatform platform = Theme.of(this).platform;
    return platform == TargetPlatform.macOS || platform == TargetPlatform.windows || platform == TargetPlatform.linux;
  }
}
