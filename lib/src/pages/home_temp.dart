import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        //children: _createItems()
        children: _createItemsShort()
      )
    );
  }

  /* List <Widget> _createItems() {
    
    List<Widget> lista = new List<Widget>();

    for (String opt in options) {

      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista
      ..add(tempWidget)
      ..add(Divider());
    } // for

    return lista;
  } */

  List <Widget> _createItemsShort() {

    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text(item + '!'),
            subtitle: Text('subtitle $item'),
            onTap: () {}
          ),
          Divider()
        ],
      );
    
    })
    .toList();

  }
}