import 'package:flutter/widgets.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/tokens/text_tokens.dart';

class FontFoundation {
  FontFoundation._internal();

  static final _Title title = _Title._();
  static final _Paragraph paragraph = _Paragraph._();
}

class _Title {
  _Title._();

  // Size 16 black
  final TextStyle bold16Black = TextTokens.manrope.bold_16.copyWith(color: ColorFoundation.text.black);
  final TextStyle semiBold16Black = TextTokens.manrope.semibold_16.copyWith(color: ColorFoundation.text.black);
  final TextStyle medium16Black = TextTokens.manrope.medium_16.copyWith(color: ColorFoundation.text.black);
  final TextStyle regular16Black = TextTokens.manrope.regular_16.copyWith(color: ColorFoundation.text.black);

  // Size 18 black
  final TextStyle bold18Black = TextTokens.manrope.bold_18.copyWith(color: ColorFoundation.text.black);
  final TextStyle semiBold18Black = TextTokens.manrope.semibold_18.copyWith(color: ColorFoundation.text.black);
  final TextStyle medium18Black = TextTokens.manrope.medium_18.copyWith(color: ColorFoundation.text.black);
  final TextStyle regular18Black = TextTokens.manrope.regular_18.copyWith(color: ColorFoundation.text.black);
  
  // Size 20 black
  final TextStyle bold20Black = TextTokens.manrope.bold_20.copyWith(color: ColorFoundation.text.black);
  final TextStyle semiBold20Black = TextTokens.manrope.semibold_20.copyWith(color: ColorFoundation.text.black);
  final TextStyle medium20Black = TextTokens.manrope.medium_20.copyWith(color: ColorFoundation.text.black);
  final TextStyle regular20Black = TextTokens.manrope.regular_20.copyWith(color: ColorFoundation.text.black);
  
  // Size 16 blue
  final TextStyle bold16Blue2 = TextTokens.manrope.bold_16.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle semiBold16Blue2 = TextTokens.manrope.semibold_16.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle medium16Blue2 = TextTokens.manrope.medium_16.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle regular16Blue2 = TextTokens.manrope.regular_16.copyWith(color: ColorFoundation.text.blue2);

  // Size 18 blue
  final TextStyle bold18Blue2 = TextTokens.manrope.bold_18.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle semiBold18Blue2 = TextTokens.manrope.semibold_18.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle medium18Blue2 = TextTokens.manrope.medium_18.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle regular18Blue2 = TextTokens.manrope.regular_18.copyWith(color: ColorFoundation.text.blue2);
}

class _Paragraph {
  _Paragraph._();

  // Size 12 black
  final TextStyle bold12Black = TextTokens.manrope.bold_12.copyWith(color: ColorFoundation.text.black);
  final TextStyle semiBold12Black = TextTokens.manrope.semibold_12.copyWith(color: ColorFoundation.text.black);
  final TextStyle medium12Black = TextTokens.manrope.medium_12.copyWith(color: ColorFoundation.text.black);
  final TextStyle regular12Black = TextTokens.manrope.regular_12.copyWith(color: ColorFoundation.text.black);

  // Size 14 black
  final TextStyle bold14Black = TextTokens.manrope.bold_14.copyWith(color: ColorFoundation.text.black);
  final TextStyle semiBold14Black = TextTokens.manrope.semibold_14.copyWith(color: ColorFoundation.text.black);
  final TextStyle medium14Black = TextTokens.manrope.medium_14.copyWith(color: ColorFoundation.text.black);
  final TextStyle regular14Black = TextTokens.manrope.regular_14.copyWith(color: ColorFoundation.text.black);

  // Size 12 blue
  final TextStyle bold12Blue2 = TextTokens.manrope.bold_12.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle semiBold12Blue2 = TextTokens.manrope.semibold_12.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle medium12Blue2 = TextTokens.manrope.medium_12.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle regular12Blue2 = TextTokens.manrope.regular_12.copyWith(color: ColorFoundation.text.blue2);

  // Size 14 blue
  final TextStyle bold14Blue2 = TextTokens.manrope.bold_14.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle semiBold14Blue2 = TextTokens.manrope.semibold_14.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle medium14Blue2 = TextTokens.manrope.medium_14.copyWith(color: ColorFoundation.text.blue2);
  final TextStyle regular14Blue2 = TextTokens.manrope.regular_14.copyWith(color: ColorFoundation.text.blue2);
}
