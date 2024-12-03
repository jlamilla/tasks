import 'package:task/core/design/layout_all_imports.dart';

class PortraitTabletLayoutFormat extends LayoutFormat {
  PortraitTabletLayoutFormat();

  @override
  LayoutPixelFormat get pixel => LayoutPixelFormat.physical;

  @override
  Map<LayoutBreakpoint, double> get breakpoints => <LayoutBreakpoint, double>{
        LayoutBreakpoint.xs: 720,
        LayoutBreakpoint.sm: 1080,
        LayoutBreakpoint.md: 1125,
        LayoutBreakpoint.lg: 1440,
        LayoutBreakpoint.xl: 2160,
      };

  @override
  LayoutValue<double> get maxWidth => const BreakpointValue<double>.all(
        xs: 720,
        sm: 1080,
        md: 1125,
        lg: 1440,
        xl: 2160,
      );
}
