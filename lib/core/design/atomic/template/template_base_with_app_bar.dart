import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/molecules/app_bar/app_bar_custom.dart';
import 'package:task/core/design/atomic/tokens/gen/assets.gen.dart';
import 'package:task/core/design/responsive/layout.dart';
import 'package:task/core/services/logger_service.dart';

class TemplateBaseWithAppBar extends StatelessWidget {
  const TemplateBaseWithAppBar({
    super.key,
    required this.body,
    this.paddingBody,
  });

  final Widget body;
  final EdgeInsetsGeometry? paddingBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFoundation.background.white2,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorFoundation.background.blue,
        onPressed: (){
          LoggerService.log('Tap add');
        },
        child: AssetsToken.icons.add.svg(
          color: ColorFoundation.background.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          const AppBarCustom(title: 'All tasks',),
          Padding(
            padding: paddingBody ?? EdgeInsets.symmetric(
              vertical: context.layout.value<double>(
                xs: context.layout.height * 0.008,
                sm: context.layout.height * 0.008,
                md: context.layout.height * 0.009,
                lg: context.layout.height * 0.009,
              ),
            ),
            child: SizedBox(
              height: context.layout.value<double>(
                xs: context.layout.height * 0.32,
                sm: context.layout.height * 0.32,
                md: context.layout.height * 0.30,
                lg: context.layout.height * 0.30,
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
