import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/design/atomic/atoms/splash/splash_provider.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/tokens/gen/assets.gen.dart';
import 'package:task/core/design/responsive/layout.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: context.layout.value<double>(
              xs: screenWidth * 0.125,
              sm: screenWidth * 0.18,
              md: screenWidth * 0.17,
              lg: screenWidth * 0.16,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AssetsToken.images.logo.image(
                fit: BoxFit.cover,
                width: context.layout.value<double>(
                  xs: screenWidth * 0.9,
                  sm: screenWidth * 0.8,
                  md: screenWidth * 0.7,
                  lg: screenWidth * 0.7,
                ),
                height: context.layout.value<double>(
                  xs: screenWidth * 0.9,
                  sm: screenWidth * 0.8,
                  md: screenWidth * 0.7,
                  lg: screenWidth * 0.7,
                ),
              ),
              SizedBox(
                height: context.layout.value<double>(
                  xs: screenWidth * 0.0,
                  sm: screenWidth * 0.0,
                  md: screenWidth * 0.01,
                  lg: screenWidth * 0.01,
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159),
                child: CircularGradientSpinner(
                  color: ColorFoundation.background.blue,
                  size: 40,
                  strokeWidth: 4,
                  spinnerDirection: SpinnerDirection.antiClockwise,
                ),
              ),
              Consumer<SplashProvider>(
                builder: (BuildContext context, SplashProvider splashProvider, Widget? child) {
                  splashProvider.loadAppResources(context);
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
