import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  bool _bloquearSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        min: 10.0,
        max: 400.0,
        // divisions: 20,
        value: _valorSlider,
        label: 'Tamaño De La Imagen',
        activeColor: Colors.indigoAccent,
        onChanged: (_bloquearCheck || _bloquearSwitch)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  /* Algunos Widgets Si No Tienen La Propiedad OnChanged Entonces Quedan Bloqueadas Por Defecto */
  Widget _checkBox() {
    /* CHECKBOX SENCILLO */
    /* return Checkbox(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    ); */

    /* CHECKBOX MÀS COMPLETO */
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearSwitch,
      onChanged: (value) {
        setState(() {
          _bloquearSwitch = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png?w=440'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
