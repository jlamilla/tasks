import 'package:flutter/material.dart';
import 'package:task/core/design/layout_all_imports.dart';

typedef LayoutWidgetBuilder = Widget Function(
  BuildContext context,
  LayoutContext layout,
  Widget? child,
);

class AdaptiveBuilder extends StatelessWidget {

  AdaptiveBuilder({
    super.key,
    required WidgetBuilder xs,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
  })  : this.child = BreakpointValue<Widget Function(BuildContext)>(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  AdaptiveBuilder.builder({
    super.key,
    required LayoutWidgetBuilder builder,
    Widget? child,
  })  : this.child = LayoutValue<Widget Function(BuildContext)>.builder((LayoutContext layoutContext) {
    return (BuildContext context) => builder(context, layoutContext, child);
  });

  const AdaptiveBuilder.raw({super.key, required this.child});
  final LayoutValue<WidgetBuilder> child;

  @override
  Widget build(BuildContext context) {
    return context.layout.resolve(child)(context);
  }
}
