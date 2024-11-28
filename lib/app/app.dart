import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/config/di/dependencies/providers/providers_register.dart';
import 'package:task/core/config/routes/pages.dart';
import 'package:task/core/design/layout_all_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Layout(
        format: context.responsiveValue<LayoutFormat>(
          mobile: PortraitPhysicalPixelLayoutFormat(),
          tablet: PortraitTabletLayoutFormat(),
        ),
        child: MaterialApp.router(
          routerConfig: Pages.appRouter,  
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
