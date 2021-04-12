/* Este Paquete Es Para Leer Json En Flutter, Solo Expongo El 
Objeto Que Me Interesa, Ese rootBundle Tiene Lo Necesario Para Leer
El Archivo .json */
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  /* No Puedo Tener Constructores Asyncronos */
  _MenuProvider() {
    // cargarData();
  }

  /* Cuando Trabajo Con Tareas Asincronas Lo Que Hago Es Retornar Un Future */
  /* Future => Es Retornar Una Tarea Que Se Va A Resolver En Un Futuro */
  /* Lo Anterior Permite Trabajar En Un StatelessWidget Con Algo Llamado El
     Future.builder(), Es Decir, Que Se Construya Cuando Se Termine El
     Proceso De Solicitar La Data, Por Ende, CargarData() Ya No Es Necesario
     En El Constructor */

  Future<List<dynamic>> cargarData() async {
    /* Este Paquete Es Para Leer Json En Flutter (Promesas)*/
    /* rootBundle.loadString('data/menu_opts.json').then((data) {
      Map dataMap = json.decode(data);
      print('Rutas Promesa => ${dataMap['rutas']}');
      opciones = dataMap['rutas'];
    }); */

    /* AQUI UTILIZAMOS ASYNC - AWAIT */
    /* Este Es El Ultimo Future Que Interactua Con El Future Builder
      De HomePage() */
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    // print('Rutas Promesa => ${dataMap['rutas']}');
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
