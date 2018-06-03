import 'package:flutter/material.dart';
import 'dart:math';

class ViewList extends StatefulWidget {
  ViewList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ViewListState createState() => new ViewListState();
}

// [START Class ViewListState]
class ViewListState extends State<ViewList> {
  List<String> itemList = getItemList();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: itemList.map((String item) {
            return new Row(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0)),

                new Text(
                  item,
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),

              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  // [START Class Methods]
  static List<String> getItemList() {
    List<String> itemList = new List();
    List<String> words = [
      "apple",
      "bird",
      "cat",
      "dart",
      "e-mail",
      "friend",
      "home"
    ];

    for (int i = 0; i < 50; i++) {
      int wordIndex = new Random().nextInt(words.length);
      itemList.add(words[wordIndex]);
    }

    return itemList;
  }
  // [END Class Methods]
}
// [END Class ViewListState]
