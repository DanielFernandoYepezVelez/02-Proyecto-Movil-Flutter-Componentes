import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Alert Page')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),

          // Navigate.pop(context) Para Cerrar La Pantalla Alert Cuando Se Haga Click En El Button
          onPressed: () => Navigator.pop(context),
        ));
  }
}
