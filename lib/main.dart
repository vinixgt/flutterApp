
/* 
Bam
taza: 1.83% mensual/ 22 anual
Platinum": 23639.82
Gold: 12730.56
 */

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';


import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Hebrew
        // ... other locales the app supports
      ],
      title: 'Material App',
      /* home: Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: HomePage(),

      ), */
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {
        print('ruta llamada: ${ settings.name }');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}