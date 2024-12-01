import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/foundations/font_fundation.dart';
import 'package:task/core/design/atomic/tokens/gen/assets.gen.dart';
import 'package:task/core/design/responsive/layout.dart';

class AnimatedCheckbox extends StatefulWidget {

  const AnimatedCheckbox({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onChanged,
    required this.onDeleted,
    this.initialValue = false,
  });

  final String title;
  final String subTitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final void Function() onDeleted;

  @override
  _AnimatedCheckboxState createState() => _AnimatedCheckboxState();
}

class _AnimatedCheckboxState extends State<AnimatedCheckbox> with SingleTickerProviderStateMixin {
  late bool _isChecked;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (_isChecked) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;

      if (_isChecked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.layout.value<double>(
          xs: context.layout.height * 0.02,
          sm: context.layout.height * 0.02,
          md: context.layout.height * 0.01,
          lg: context.layout.height * 0.01,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: _toggleCheckbox,
              splashColor: ColorFoundation.background.transparent,
              highlightColor: ColorFoundation.background.transparent,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: context.layout.value<double>(
                      xs: context.layout.width * 0.03,
                      sm: context.layout.width * 0.03,
                      md: context.layout.width * 0.02,
                      lg: context.layout.width * 0.02,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    height: context.layout.width * 0.02,
                    width: context.layout.width * 0.02,
                    decoration: BoxDecoration(
                      color: _isChecked ? ColorFoundation.background.blue : ColorFoundation.background.transparent,
                      border: Border.all(
                        color: _isChecked ? ColorFoundation.background.blue : ColorFoundation.border.borderCheck,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: ColorFoundation.background.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.layout.value<double>(
                      xs: context.layout.width * 0.03,
                      sm: context.layout.width * 0.03,
                      md: context.layout.width * 0.02,
                      lg: context.layout.width * 0.02,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: context.layout.value(
                            xs: FontFoundation.title.medium16Black,
                            sm: FontFoundation.title.medium16Black,
                            md: FontFoundation.title.medium18Black,
                            lg: FontFoundation.title.medium18Black,
                          ).copyWith(
                          color: _isChecked ? ColorFoundation.background.black.withOpacity(0.5) : null,
                          decoration: _isChecked ? TextDecoration.lineThrough : null,
                        ),
                        child: Text(widget.title),
                      ),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: context.layout.value(
                            xs: FontFoundation.paragraph.medium14Blue2,
                            sm: FontFoundation.paragraph.medium14Blue2,
                            md: FontFoundation.title.medium16Blue2,
                            lg: FontFoundation.title.medium16Blue2,
                          ).copyWith(
                          color: _isChecked ? ColorFoundation.background.blue.withOpacity(0.5) : null,
                          decoration: _isChecked ? TextDecoration.lineThrough : null,
                        ),
                        child: Text(widget.subTitle),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.layout.value<double>(
                xs: context.layout.width * 0.03,
                sm: context.layout.width * 0.03,
                md: context.layout.width * 0.02,
                lg: context.layout.width * 0.02,
              ),
            ),
            child: InkWell(
              onTap: widget.onDeleted,
              splashColor: ColorFoundation.background.transparent,
              highlightColor: ColorFoundation.background.transparent,
              child: Container(
                padding: EdgeInsets.all(context.layout.width * 0.01),
                child: AssetsToken.icons.trash.svg(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
