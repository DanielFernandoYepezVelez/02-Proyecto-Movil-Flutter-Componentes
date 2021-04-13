import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        /* Para Tener Mas Control De La Ubicación De La Tarjeta */
        // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy El Titulo De Esta Tarjeta'),
            subtitle: Text(
                'Aquí Estamos Con La Descripción De La Tarjeta Para Mostrar El Comportamiento De La Misma'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Confirmar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _cardTipo2() {
  /* Asi Deberia Ser Si Se Utiliza La Forma Alternativa Que Tenemos En La Parte Inferior */
  // final card = Container();

  return Card(
    elevation: 10.0,
    /* Sombras Para La Card (TextShadow) */
    clipBehavior: Clip.antiAlias,
    /* Se Afecte Lo Que Tenemos Dentro Del Card */
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    /* Border Radius */
    child: Column(
      children: [
        /* Para Cargar El Loading De Las Imagenes(FadeInImage).
          Tiene Una Propiedad Que Se LLama Placeholder:
          Es La Imagen Que Deberia Estar Fisicamente En
          El Dispositivo, Por Que Cargaria De Forma Instantanea
          Y Es La Que Se Va A Cargar En La Card, Mientras La
          Imagen Que Viene Por La Web Es Cargada
        */
        FadeInImage(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/d/d1/View_of_Guatap%C3%A9_from_El_Pe%C3%B1%C3%B3n.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300,
          fit: BoxFit.cover,
        ),

        // Image(
        //   image: NetworkImage(
        //       'https://upload.wikimedia.org/wikipedia/commons/d/d1/View_of_Guatap%C3%A9_from_El_Pe%C3%B1%C3%B3n.jpg'),
        // ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Guatape, Municipio De Antioquia'))
      ],
    ),
  );

  /* Con El Elevation, El clipBehavior Y Shape Funciona Correctamente.
    Pero Lo Voy Hacer De La Forma Larga Como El Instructor Para
    Tener Otra Alternativa
   */
  /* return */ Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ]),
    child: ClipRRect(/*child:  card */), // Para Recortar
  );
}
