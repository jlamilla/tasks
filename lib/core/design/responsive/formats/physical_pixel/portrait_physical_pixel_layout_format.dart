import 'package:task/core/design/layout_all_imports.dart';

class PortraitPhysicalPixelLayoutFormat extends LayoutFormat {
  PortraitPhysicalPixelLayoutFormat({
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
    LayoutBreakpoint.xs: 480, // FWVGA
    LayoutBreakpoint.sm: 720, // HD
    LayoutBreakpoint.md: 1080, // FHD
    LayoutBreakpoint.lg: 1440, //
    LayoutBreakpoint.xl: 1768, // QHD
  };

  @override
  LayoutValue<double> get maxWidth => const BreakpointValue<double>.all(
    xs: 480,
    sm: 720,
    md: 1080,
    lg: 1125,
    xl: 1440,
  );
}
