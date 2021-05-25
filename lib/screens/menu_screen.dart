import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aulas de Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('carousselImage');
              },
              color: Colors.blue,
              child: Text(
                'Carrossel de imagens',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('pullToRefresh');
              },
              color: Colors.blue,
              child: Text(
                'Pull To Refresh',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('multipleListView');
              },
              color: Colors.blue,
              child: Text(
                'ListViews Aninhadas',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
