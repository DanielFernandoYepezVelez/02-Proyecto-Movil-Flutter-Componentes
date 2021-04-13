import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Alert Page')),
        body: Center(
          child: ElevatedButton(
            child: Text('Mostrar Alert'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red, shape: StadiumBorder()),
            onPressed: () => _mostrarAlert(context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),

          // Navigate.pop(context) Para Cerrar La Pantalla Alert Cuando Se Haga Click En El Button
          onPressed: () => Navigator.pop(context),
        ));
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Esta Es La Caja De La Alerta'),
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
