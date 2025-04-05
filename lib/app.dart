import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/navigation_menu.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/check_get_order.dart';
import 'package:shipping_clothing_store/presentation/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shipping_clothing_store/core/utils/theme/theme.dart';
import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && locales.isNotEmpty) {
      setState(() {
        _locale = locales.first;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          routes: {
          '/home': (context) => NavigationMenu(),
          '/login': (context) => LoginScreen(),
          '/checkGetOrder': (context) {
      final order = ModalRoute.of(context)!.settings.arguments as OrderModel;
      return CheckGetOrderScreen(order: order); 
    },
        },
        debugShowCheckedModeBanner: false, //DEBUG clóe 
        themeMode: ThemeMode.system, // Tự động thay đổi theo hệ thống
        theme: CAppTheme.lightTheme, // Giao diện sáng
        darkTheme: CAppTheme.darkTheme, // Giao diện tối
        // home: const NavigationMenu(),
        home: const LoginScreen(),
        supportedLocales: const [
        Locale('vi', ''), // VietNam
        Locale('en', ''), // English
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale, // Automatically update locale
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale != null &&
              locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // Default locale
      },); 
        
  }
}
