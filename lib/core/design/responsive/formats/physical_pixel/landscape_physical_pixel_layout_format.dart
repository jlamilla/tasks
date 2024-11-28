

import 'package:task/core/design/layout_all_imports.dart';

class LandscapePhysicalPixelLayoutFormat extends LayoutFormat {
  LandscapePhysicalPixelLayoutFormat({
    LayoutValue<double>? margin,
    LayoutValue<double>? gutter,
  })  : _margin = margin ?? const ConstantLayoutValue<double>(0),
        _gutter = gutter ?? const ConstantLayoutValue<double>(0);

  final LayoutValue<double> _margin;
  final LayoutValue<double> _gutter;

  @override
  LayoutPixelFormat get pixel => LayoutPixelFormat.physical;

  @override
  LayoutValue<double> get gutter => _gutter;

  @override
  LayoutValue<double> get margin => _margin;

  @override
  Map<LayoutBreakpoint, double> get breakpoints => <LayoutBreakpoint, double>{
    LayoutBreakpoint.xs: 854, // FWVGA
    LayoutBreakpoint.sm: 1180, // HD
    LayoutBreakpoint.md: 1920, // FHD
    LayoutBreakpoint.lg: 2260, //
    LayoutBreakpoint.xl: 2960, // QHD
  };

  @override
  LayoutValue<double> get maxWidth => const BreakpointValue<double>.all(
    xs: 854,
    sm: 1180,
    md: 1920,
    lg: 2260,
    xl: 2960,
  );
}
