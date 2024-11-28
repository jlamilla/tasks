import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/font_fundation.dart';
import 'package:task/core/design/atomic/tokens/gen/assets.gen.dart';
import 'package:task/core/design/responsive/layout.dart';
import 'package:task/core/services/logger_service.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key, 
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      alignment: Alignment.center,
      height: context.layout.height * 0.03,
      width: context.layout.width,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: context.layout.value<TextStyle>(
                xs: FontFoundation.title.bold18Black,
                sm: FontFoundation.title.bold18Black,
                md: FontFoundation.title.bold20Black,
                lg: FontFoundation.title.bold20Black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: context.layout.value<double>(
                xs: context.layout.width * 0.02,
                sm: context.layout.width * 0.02,
                md: context.layout.width * 0.018,
                lg: context.layout.width * 0.019,
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: (){
                  LoggerService.log('Tap config');
                },
                child: Container(
                  padding: EdgeInsets.all(context.layout.width * 0.01),
                  child: AssetsToken.icons.settings.svg(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
