import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /* Cuando Obtenemos Las Opciones, Es Un Poco Tarde
    Por Que Mi ListView Ya Se Ha Creado */
    // print('Opciones De La Lista => ${menuProvider.opciones}');

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print('builder =>');
        // print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data) {
    final List<Widget> itemsFinales = [];

    data.forEach((item) {
      final widgetTemp = ListTile(
        leading: Icon(Icons.account_circle, color: Colors.blue),
        title: Text(item['texto']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {},
      );

      itemsFinales..add(widgetTemp)..add(Divider());
    });

    return itemsFinales;
  }
}
