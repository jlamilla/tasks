import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/atoms/action_button/action_button_modal.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/molecules/app_bar/app_bar_custom.dart';

class TemplateBaseWithAppBar extends StatelessWidget {
  const TemplateBaseWithAppBar({
    super.key,
    required this.titleAppbar, 
    required this.body,
    required this.onPressedFloatingActionButton,
    this.paddingBody, 
  });

  final String titleAppbar;
  final Widget body;
  final EdgeInsetsGeometry? paddingBody;
  final void Function() onPressedFloatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFoundation.background.white2,
      floatingActionButton: FloatingActionButtonModalCustom(
        onPressed: onPressedFloatingActionButton,
      ),
      body: Column(
        children: <Widget>[
          AppBarCustom(title: titleAppbar),
          Expanded(child: body),
        ],
      ),
    );
  }
}
