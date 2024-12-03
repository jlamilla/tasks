import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/config/di/dependencies/providers/providers_register.dart';
import 'package:task/core/config/internationalization/localizations_delegates.dart';
import 'package:task/core/config/internationalization/supported_locales.dart';
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
          supportedLocales: SupportedLocales.locales,
          localizationsDelegates: LocalizationsDelegates.locations,
          locale: SupportedLocales.locale,
          routerConfig: Pages.appRouter,  
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
