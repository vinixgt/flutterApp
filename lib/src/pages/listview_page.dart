import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numbersList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addMore();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_addMore();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List view'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),  
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numbersList.length,
      itemBuilder: (BuildContext context, int index) {
        final id = _numbersList[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/600/300/?image${id}'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  void _addMore() {
    for (var i = 1; i < 5; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {});
  }


  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, responseHttp);
  }

  void responseHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      duration: new Duration(milliseconds: 1500), 
      curve: Curves.fastOutSlowIn,
    );

    _addMore();
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ]
      );
    } else {
      return Container();
    }
  }


}