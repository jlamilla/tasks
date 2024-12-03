import 'package:task/core/design/responsive/breakpoint.dart';
import 'package:task/core/design/responsive/format.dart';
import 'package:task/core/design/responsive/pixel.dart';
import 'package:task/core/design/responsive/value.dart';

class BoostrapLayoutFormat extends LayoutFormat {
  BoostrapLayoutFormat({
    LayoutValue<double>? margin,
  }) : _margin = margin ?? const ConstantLayoutValue<double>(0);

  final LayoutValue<double> _margin;
  final LayoutValue<double> _gutter = const ConstantLayoutValue<double>(30.0);

  @override
  LayoutValue<double> get margin => _margin;

  @override
  LayoutValue<double> get gutter => _gutter;

  @override
  LayoutPixelFormat get pixel => LayoutPixelFormat.logical;

  @override
  Map<LayoutBreakpoint, double> get breakpoints => <LayoutBreakpoint, double>{
        LayoutBreakpoint.xs: 0,
        LayoutBreakpoint.sm: 576,
        LayoutBreakpoint.md: 768,
        LayoutBreakpoint.lg: 992,
        LayoutBreakpoint.xl: 1200,
      };

  @override
  LayoutValue<double> get maxWidth => const BreakpointValue<double>.all(
    xs: 576,
    sm: 540,
    md: 720,
    lg: 960,
    xl: 1140,
  );
}
