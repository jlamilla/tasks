import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task/core/config/di/dependencies/providers/providers_register.dart';
import 'package:task/core/config/routes/pages.dart';
import 'package:task/core/design/layout_all_imports.dart';
import 'package:task/core/design/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderLit().listProvider,
      child: Layout(
        format: context.responsiveValue<LayoutFormat>(
          mobile: PortraitPhysicalPixelLayoutFormat(),
          tablet: PortraitTabletLayoutFormat(),
        ),
        child: MaterialApp.router(
          theme: AppTheme.getTheme(),
          supportedLocales: const <Locale>[
            Locale('en', 'US'),
          ],
          localizationsDelegates: const <LocalizationsDelegate<void>>[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale('en', 'US'),
          routerConfig: Pages.appRouter,  
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
