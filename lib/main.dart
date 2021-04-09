import 'package:flutter/material.dart';

// import 'package:flutter_components/src/pages/alert_page.dart';
// import 'package:flutter_components/src/pages/home_page.dart';
// import 'package:flutter_components/src/pages/avatar_page.dart';
// import 'package:flutter_components/src/pages/home_temp.dart';
import 'package:flutter_components/src/pages/card_page.dart';

import 'package:flutter_components/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(title: 'Material App', home: HomePageTemp());
    return MaterialApp(
      title: 'Material App',
      // home: HomePage();
      initialRoute: '/',

      /* Rutas Definidas En La Aplicación */
      routes: getApplicationRoutes(),

      /* Rutas Dinámicas En La Aplicación, Es Decir, No Estan Definidas Desde 
        Una Url En El getApplicationRoutes(), Pero Es Llamada O Requerida 
        En La Aplicación */
      onGenerateRoute: (RouteSettings settings) {
        print(
            'Aqui Tenemos El Nombre De La Ruta A La Cual Se LLamo ${settings.name}');

        return MaterialPageRoute(builder: (BuildContext context) => CardPage());
      },
    );
  }
}
