import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/tokens/gen/assets.gen.dart';

class FloatingActionButtonModalCustom extends StatelessWidget {
  const FloatingActionButtonModalCustom({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: ColorFoundation.background.blue,
      onPressed: onPressed,
      child: AssetsToken.icons.add.svg(color: ColorFoundation.background.white),
    );
  }
}
