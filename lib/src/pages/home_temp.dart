import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Temp')),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  /* SEGUNDA FORMA DE RETORNAR LA LISTA DE FORMA CORTA*/
  List<Widget> _crearItemsCorta() {
    return opciones.map((opcion) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.access_alarm_rounded),
            title: Text(opcion + '!'),
            subtitle: Text('Subtitulo Item $opcion'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }

  /* PRIMERA FORMA DE RETORNAR LA LISTA */
  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opcion in opciones) {
      final tempWidget = ListTile(
        title: Text(opcion),
      );

      /* (..) => Operador En Cascada 
      Agregue El Método add() Una Primera Vez
      Luego Vuelva A La Lista Y Agregue Por Segunda Vez
      El Método add() Con El Divider */
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }
}
