import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
              Expanded(child: _createImage()),
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
            ],
          )
        )
    );
  }


  _createSlider() {
    return Slider(
      //activeColor: Colors.indigoAccent,
      label: 'Tama;o de imagen',
      divisions: 20,
      value: _sliderValue,
      min: 10,
      max: 400,

      onChanged: !_blockCheck ? null : (value) {
        setState(() {
          _sliderValue = value;
        });
      },
    ) ;
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://soycomocomo.es/media/2019/03/zanahorias.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
      
  }

  Widget _createCheckbox() {

    return CheckboxListTile(
      title: Text('Blockear slider'),
      value: _blockCheck, 
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      }
    );
    /* return Checkbox(
      value: _blockCheck, 
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
          
        });
      }
    ); */
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck, 
      onChanged: (valor) {
        setState(() {
          _blockCheck = valor;
        });
      }
    );
  }


} // end class