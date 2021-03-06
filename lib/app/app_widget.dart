import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/features/localization/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'test',
      builder: (context) {
        //    if (controller.appThemeInterface.getThemeData() != null) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Modular.navigatorKey,
          title: 'Flutter Slidy',
          theme: Modular.get<AppController>().appThemeInterface.getThemeData(),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('pt', 'BR'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
        //  } else {
        //    return Center(
        //      child: CircularProgressIndicator(),
        //    );
        //  }
      },
    );
  }
}
