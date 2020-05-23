
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  //const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards'),),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget> [
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
        ]
      )
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Soy Titulo'),
            subtitle: Text('Esta es una intro de la tarjeta lorem ipsum lorem ipsum. Esta es una intro de la tarjeta lorem ipsum lorem ipsum'),
            leading: Icon(Icons.photo_album, color: Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {}
              ),
              FlatButton(
                child: Text('Accept'),
                onPressed: () {}
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: <Widget> [
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
             
          ),
          /* Image(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
            
          ), */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que escribir')
          ),
        ]
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,

            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(3.0, 10)
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

}