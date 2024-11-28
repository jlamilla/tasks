import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/design/layout_all_imports.dart';

class Gutter extends StatelessWidget {
  const Gutter([
    this.extent,
    Key? key,
  ]) : super(key: key);

  final double? extent;

  static List<Widget> separateChildren({
    required List<Widget> children,
    double? extent,
  }) =>
      children.separate(extent);

  @override
  Widget build(BuildContext context) {
    return Gap(extent ?? context.layout.gutter);
  }
}

class SliverGutter extends StatelessWidget {
  const SliverGutter([
    this.extent,
    Key? key,
  ]) : super(key: key);
  final double? extent;

  @override
  Widget build(BuildContext context) {
    return SliverGap(extent ?? context.layout.gutter);
  }
}

extension ListGutter on List<Widget> {
  List<Widget> separate(double? extend) => length <= 1
    ? this
    : sublist(1).fold(
      <Widget>[first],
      (List<Widget> r, Widget element) => <Widget>[...r, Gutter(extend), element],
    );
}
