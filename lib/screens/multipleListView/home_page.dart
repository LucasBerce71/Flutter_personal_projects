import 'package:flutter/material.dart';

class MultipleListViewScreen extends StatelessWidget {

  List<String> category;
  List<String> itens;

  MultipleListViewScreen({
    Key key,
  }) : super(key: key) {
    category = List.generate(10, (index) => "Categoria: $index");
    itens = List.generate(10, (index) => "Ítem: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ListViews aninhadas'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        category[index], 
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: itens.length,
                        itemBuilder: (_, int index) {
                          return ListTile(
                            title: Text(itens[index]),
                          );
                        }
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
