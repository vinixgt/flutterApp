import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page')
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.free_breakfast),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );
  }

  void _showAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15.0)),
          title: Text('Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is the content of alert box'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: <Widget> [
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop()
            ),
            FlatButton(
              child: Text('Accept'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]
        );
      
      },
    );


  }
}