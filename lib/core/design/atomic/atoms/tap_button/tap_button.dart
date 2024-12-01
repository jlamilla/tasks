import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/foundations/font_fundation.dart';
import 'package:task/core/design/responsive/layout.dart';

class TapButton extends StatelessWidget {
  const TapButton({
    super.key,
    required this.title,
    this.isSelect = false,
    this.onTap, 
  });

  final String title;
  final void Function()? onTap;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: isSelect ? ColorFoundation.background.white2 : ColorFoundation.background.white3,
      elevation: isSelect ? 0.4 : 0,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        highlightColor: ColorFoundation.background.white3,
        splashColor: ColorFoundation.background.white3,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.layout.value<double>(
              xs: screenWidth * 0.03,
              sm: screenWidth * 0.03,
              md: screenWidth * 0.04,
              lg: screenWidth * 0.04,
            ),
            vertical: context.layout.value<double>(
              xs: screenHeight * 0.02,
              sm: screenHeight * 0.02,
              md: screenHeight * 0.01,
              lg: screenHeight * 0.01,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.layout.value<TextStyle>(
              xs: FontFoundation.paragraph.medium14Black,
              sm: FontFoundation.paragraph.medium14Black,
              md: FontFoundation.title.medium16Black,
              lg: FontFoundation.title.medium16Black,
            ),
          ),
        ),
      ),
    );
  }
}
