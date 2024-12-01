import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/tokens/gen/fonts.gen.dart';

class TextTokens {
  TextTokens._internal();
  static ManropeText manrope = ManropeText._();
}

class ManropeText {
  ManropeText._();

  static const TextStyle _manrope = TextStyle(fontFamily: FontFamilyToken.manrope, decoration: TextDecoration.none);

  // Font Size : 12
  final TextStyle light_12 = _manrope.copyWith(fontWeight: FontWeight.w300, fontSize: 12);
  final TextStyle regular_12 = _manrope.copyWith(fontWeight: FontWeight.w400, fontSize: 12);
  final TextStyle medium_12 = _manrope.copyWith(fontWeight: FontWeight.w500, fontSize: 12);
  final TextStyle semibold_12 = _manrope.copyWith(fontWeight: FontWeight.w600, fontSize: 12);
  final TextStyle bold_12 = _manrope.copyWith(fontWeight: FontWeight.w700, fontSize: 12);
  final TextStyle extrabold_12 = _manrope.copyWith(fontWeight: FontWeight.w800, fontSize: 12);

  // Font Size : 14
  final TextStyle light_14 = _manrope.copyWith(fontWeight: FontWeight.w300, fontSize: 14);
  final TextStyle regular_14 = _manrope.copyWith(fontWeight: FontWeight.w400, fontSize: 14);
  final TextStyle medium_14 = _manrope.copyWith(fontWeight: FontWeight.w500, fontSize: 14);
  final TextStyle semibold_14 = _manrope.copyWith(fontWeight: FontWeight.w600, fontSize: 14);
  final TextStyle bold_14 = _manrope.copyWith(fontWeight: FontWeight.w700, fontSize: 14);
  final TextStyle extrabold_14 = _manrope.copyWith(fontWeight: FontWeight.w800, fontSize: 14);

  // Font Size : 16
  final TextStyle light_16 = _manrope.copyWith(fontWeight: FontWeight.w300, fontSize: 16);
  final TextStyle regular_16 = _manrope.copyWith(fontWeight: FontWeight.w400, fontSize: 16);
  final TextStyle medium_16 = _manrope.copyWith(fontWeight: FontWeight.w500, fontSize: 16);
  final TextStyle semibold_16 = _manrope.copyWith(fontWeight: FontWeight.w600, fontSize: 16);
  final TextStyle bold_16 = _manrope.copyWith(fontWeight: FontWeight.w700, fontSize: 16);
  final TextStyle extrabold_16 = _manrope.copyWith(fontWeight: FontWeight.w800, fontSize: 16);

  // Font Size : 18
  final TextStyle light_18 = _manrope.copyWith(fontWeight: FontWeight.w300, fontSize: 18);
  final TextStyle regular_18 = _manrope.copyWith(fontWeight: FontWeight.w400, fontSize: 18);
  final TextStyle medium_18 = _manrope.copyWith(fontWeight: FontWeight.w500, fontSize: 18);
  final TextStyle semibold_18 = _manrope.copyWith(fontWeight: FontWeight.w600, fontSize: 18);
  final TextStyle bold_18 = _manrope.copyWith(fontWeight: FontWeight.w700, fontSize: 18);
  final TextStyle extrabold_18 = _manrope.copyWith(fontWeight: FontWeight.w800, fontSize: 18);
  
  // Font Size : 20
  final TextStyle light_20 = _manrope.copyWith(fontWeight: FontWeight.w300, fontSize: 20);
  final TextStyle regular_20 = _manrope.copyWith(fontWeight: FontWeight.w400, fontSize: 20);
  final TextStyle medium_20 = _manrope.copyWith(fontWeight: FontWeight.w500, fontSize: 20);
  final TextStyle semibold_20 = _manrope.copyWith(fontWeight: FontWeight.w600, fontSize: 20);
  final TextStyle bold_20 = _manrope.copyWith(fontWeight: FontWeight.w700, fontSize: 20);
  final TextStyle extrabold_20 = _manrope.copyWith(fontWeight: FontWeight.w800, fontSize: 20);
}
