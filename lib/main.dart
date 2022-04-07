import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stormflutterapp/common/Global.dart';
import 'package:stormflutterapp/generated/l10n.dart';
import 'package:stormflutterapp/provider/Notifier.dart';
import 'package:stormflutterapp/router/HomeRouter.dart';
import 'package:stormflutterapp/router/LoginRouter.dart';
import 'package:stormflutterapp/router/Theme.dart';
import 'package:stormflutterapp/router/language.dart';

void main() => Global.init().then((e) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme as MaterialColor,
              textTheme: const  TextTheme(
                labelLarge: TextStyle(
                  color: Colors.yellow,
                ),
                labelMedium: TextStyle(
                  color: Colors.yellow,
                ),
                labelSmall: TextStyle(
                  // color: Colors.black,
                ),
              ),
            ),
            locale: localeModel.getLocale(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (_locale, supprotedLocales) {
              if (localeModel.getLocale() != null) {
                return localeModel.getLocale();
              } else {
                if (_locale == null) {
                  var loc = Locale("en", "US");
                  localeModel.locale = "en_US";
                  return loc;
                }
                Locale locale;
                if (supprotedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  locale = const Locale("en", "US");
                }

                localeModel.locale =
                    "${locale.languageCode}_${locale.countryCode}";

                return locale;
              }
            },
            home: HomeRouter(),
            routes: {
              "login": (context) => LoginRouter(),
              "theme": (context) => ThemeChangeRoute(),
              "language": (context) => LanguageChangeRouter(),
            },
          );
        },
      ),
    );
  }
}
