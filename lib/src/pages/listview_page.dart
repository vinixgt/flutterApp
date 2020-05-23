import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numbersList = new List();
  int _lastItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addMore();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List view'),
      ),
      body: _createList(),  
    );
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

}