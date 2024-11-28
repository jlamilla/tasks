import 'package:task/core/design/layout_all_imports.dart';

class MaterialLayoutFormat extends LayoutFormat {
  MaterialLayoutFormat({
    LayoutValue<double>? margin,
    LayoutValue<double>? gutter,
  })  : _margin = margin ?? _defaultMargin,
        _gutter = gutter ?? _defaultMargin;

  final LayoutValue<double> _margin;
  final LayoutValue<double> _gutter;

  @override
  LayoutPixelFormat get pixel => LayoutPixelFormat.logical;

  @override
  LayoutValue<double> get margin => _margin;

  @override
  LayoutValue<double> get gutter => _gutter;

  static final LayoutValue<double> _defaultMargin = LayoutValue<double>.builder(
    (LayoutContext layout) {
      return layout.width <= 719 ? 16 : 24;
    },
  );

  @override
  Map<LayoutBreakpoint, double> get breakpoints => <LayoutBreakpoint, double>{
    LayoutBreakpoint.xs: 0,
    LayoutBreakpoint.sm: 600,
    LayoutBreakpoint.md: 1024,
    LayoutBreakpoint.lg: 1440,
    LayoutBreakpoint.xl: 1920,
  };

  @override
  LayoutValue<double> get maxWidth => const BreakpointValue<double>.all(
    xs: 600,
    sm: 540,
    md: 720,
    lg: 960,
    xl: 1140,
  );

  @override
  LayoutValue<int> get columns => LayoutValue<int>.builder(
    (LayoutContext layout) {
      final double width = layout.width;
      if (width <= 599) {
        return 4;
      } else if (width <= 839) {
        return 8;
      } else {
        return 12;
      }
    },
  );
}
