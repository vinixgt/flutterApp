import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string.dart';
//import 'package:componentes/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _lists()
    );
  }

  Widget _lists() {
    menuProvider.loadData();
    
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listItems(snapshot.data, context)
        );
      },
    );
  }

  List<Widget>_listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) { 

      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          
          Navigator.pushNamed(context, element['ruta']);

        }

      );
      
      options
      ..add(widgetTemp)
      ..add(Divider());

    });
    
    return options;
  }

}