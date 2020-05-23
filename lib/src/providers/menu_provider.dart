
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    // loadData();
  }

  Future<List<dynamic>> loadData() async {

    final result = await rootBundle.loadString('static/menu_opts.json');
    
    Map dataMap = json.decode(result);
    options = dataMap['rutas'];
    return options;
  }
} // class

final menuProvider = new _MenuProvider();