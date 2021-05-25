import 'dart:math';

import 'package:flutter/material.dart';

class PullToRefreshScreen extends StatefulWidget {
  PullToRefreshScreen({Key key}) : super(key: key);

  @override
  _PullToRefreshScreenState createState() => _PullToRefreshScreenState();
}

class _PullToRefreshScreenState extends State<PullToRefreshScreen> {
  List<String> list;
  var random = new Random();

  @override
  void initState() {
    list = _generateList();
    super.initState();
  }

  _generateList() => List.generate(random.nextInt(10), (i) => 'Item $i');

  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(Duration(seconds: 2), () => _generateList());
    
    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pull To Refresh')
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text(list[index]),
            );
          },
        ),
        onRefresh: _reloadList,
      ),
    );
  }
}