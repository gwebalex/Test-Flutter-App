import 'package:flutter/material.dart';
import 'dart:math';

import 'package:test_flutter_app/view_list.dart';

void main() => runApp(new FlutterApp());

class FlutterApp extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App Title",
      theme: new ThemeData(
        primarySwatch:
            // next line show us a dynamic changing AppBar widget color
            // by checking target platform
        Theme.of(context).platform == TargetPlatform.iOS
            ? Colors.grey[100]
            : Colors.lightBlue),

      home: new HomeScreen(title: "Aleksandr Dovhaliuk"),
    );
  }
}

// [START Class HomeScreen]
/*
 * This widget is the home page of my application.
 * It is stateful, meaning that it has a State object
 * (defined below -> '_HomeScreenState') that contains fields
 * that affect how it looks.
 */
class HomeScreen extends StatefulWidget {
  // This class is the configuration for the state. It holds the values
  // (in this case the title) provided by the parent (in this case
  // the App widget - 'FlutterApp') and used by the build method
  // of the State - '_HomeScreenState'.
  // Fields in a Widget subclass are always marked "final".

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

// [START Class HomeScreenState]
class _HomeScreenState extends State<HomeScreen> {
  // a List of static colors for random setting
  static final List<Color> _colorPalette = [
    Colors.blueGrey,
    Colors.amber,
    Colors.green,
    Colors.brown,
    Colors.red,
    Colors.lightBlueAccent
  ];

  // variable : random index of a color for screen background in List<Color>
  static int _randomColorNumber = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time 'setState()' is called
    return new Scaffold(
      appBar: new AppBar(
        // like a Toolbar in java/Android
        title: new Text(widget.title),
      ),

      body: GestureDetector(
        onTap: () {
          print("onTap called.");
          setState(() {
            _randomColorNumber = new Random().nextInt(_colorPalette.length - 1);
          });
        },
        child: new Container(
          padding: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            color: _colorPalette[_randomColorNumber],
          ),
          child: new Center(
            child: new Column(
              children: <Widget>[
                // [START Text in the middle]
                new Expanded(
                  child: new Align(
                    alignment: Alignment.center,
                      child: new Text(
                        "Text in the middle",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 32.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                  ),
                ),
                // [END Text in the middle]

                // [START RaisedButtons Widget]
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // [START RaisedButton 1]
                    new RaisedButton(
                      child: new Text(
                        "Bonus: List",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.deepOrange,
                      onPressed: onBtnBonusListPressed,
                    ),
                    // [END RaisedButton 1]

                    // [START RaisedButton 2 - Reserved for future dev]
//                    new RaisedButton(
//                      child: new Text(
//                        "Bonus: Fire Exmpl",
//                        style: new TextStyle(
//                          color: Colors.white,
//                        ),
//                      ),
//                      color: Colors.lightBlueAccent,
//                      onPressed: onBtnBonusFireTestPressed,
//                    ),
                    // [END RaisedButton 2 - Reserved for future dev]
                  ],
                ),
                // [END RaisedButtons Widget]
              ],
            ),
          ),
        ),
      ),
    );
  }

  // [START Class Methods]
  void onBtnBonusListPressed() {
    // show next screen
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new ViewList(title: "View List")),
    );
  }

  void onBtnBonusFireTestPressed() {
    // reserved for future dev
  }
  // [END Class Methods]
}
// [END Class HomeScreenState]

// [END Class HomeScreen]
