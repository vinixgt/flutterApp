

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email ='';
  String _password = '';
  String _date = '';
  String _selectedOption = 'volar';

  List _powers = ['volar', 'rayos x', 'aliento'];

  TextEditingController _inputDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs de texto')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text('Letras ${ _name.length }'),        
        hintText: 'Nombre de la persona',
        labelText: 'Nombre de la persona',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _name = valor;
        });

      },
    );
    
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });

      },
    );
  }


  Widget _createPassword() {
    return TextField(
      //autofocus: true,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_outline),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });

      },
    );
  } // password


  Widget _createDate(context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Date',
        labelText: 'Date',
        suffixIcon: Icon(Icons.account_box),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
      },
    );
  } // ceateDate


  _selectDate(BuildContext context) async {
    
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null) {
      setState(() {
        _date = picked.toIso8601String();
        _inputDateController.text = _date;
      });
    }

  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List <DropdownMenuItem<String>> list = new List();

    _powers.forEach((element) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element

      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getDropdownOptions(),
            onChanged: (option) {
              setState(() {
                _selectedOption = option;
              });
            },
          )
        ),
      ]
    );
  }


}