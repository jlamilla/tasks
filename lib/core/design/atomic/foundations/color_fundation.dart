//  ..................................................
//  .██████╗.██████╗.██╗......██████╗.██████╗.███████╗
//  ██╔════╝██╔═══██╗██║.....██╔═══██╗██╔══██╗██╔════╝
//  ██║.....██║...██║██║.....██║...██║██████╔╝███████╗
//  ██║.....██║...██║██║.....██║...██║██╔══██╗╚════██║
//  ╚██████╗╚██████╔╝███████╗╚██████╔╝██║..██║███████║
//  .╚═════╝.╚═════╝.╚══════╝.╚═════╝.╚═╝..╚═╝╚══════╝
//  ..................................................

import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/tokens/gen/colors.gen.dart';

class ColorFoundation {
  ColorFoundation._internal();

  static final _Text text = _Text._();
  static final _Background background = _Background._();
  static final _Border border = _Border._();
  static final _Gradient gradient = _Gradient._();
  static final _Shadow shadow = _Shadow._();
}

class _Text {
  _Text._();
  final Color black = ColorsToken.black;
  final Color white = ColorsToken.white;
  final Color blue = ColorsToken.blue;
  final Color blue2 = ColorsToken.blue2;
  final Color gray = ColorsToken.gray;
}

class _Background {
  _Background._();
  final Color black = ColorsToken.black;
  final Color white = ColorsToken.white;
  final Color white2 = ColorsToken.white2;
  final Color white3 = ColorsToken.white3;
  final Color blue = ColorsToken.blue;
  final Color transparent = ColorsToken.transparent;
  final Color gray = ColorsToken.gray;
  final Color secondaryButton = ColorsToken.gray;
  final Color secondaryButtonSelect = ColorsToken.gray2;
  final Color primaryButton = ColorsToken.primary;
}

class _Border {
  _Border._();
  final Color borderCheck = ColorsToken.gray3;
}

class _Shadow {
  _Shadow._();

}

class _Gradient {
  _Gradient._();

}
