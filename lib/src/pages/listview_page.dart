import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  int _ultimoItem = 0;
  bool _isLoading = false;
  List<int> _listaNumeros = [];
  // List<int> _listaNumeros = [1, 2, 3, 4, 5, 6];
  ScrollController _scrollController = new ScrollController();

  /* Parecido Al Ciclo De Vida */
  /* Siempre Se Va Ha Disparar Cuando Se Entre En Esa Pantalla */
  @override
  void initState() {
    super.initState();
    _agregar10();

    /* Eventos Que Se Va Ha Escuhar El Scroll Del Dispositivo */
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: [_crearLista(), _crearLoading()]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  /* Infiniti Scroll */
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    final duration = new Duration(seconds: 2);

    setState(() {});

    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(microseconds: 250));

    _agregar10();
  }

  Widget _crearLoading() {
    if (this._isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  /* Parecido Al Ciclo De Vida */
  /* Siempre Se Va Ha Destruir El Evento Del Scroll Cuando 
  Se La Paginá Deje De Existir En El Stack De Páginas */
  /* Asi Podemos Evitar Fugas De Memoria */
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
