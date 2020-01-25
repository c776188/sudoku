import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TicTacToePage(title: 'Tic Tac Toe Page'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  TicTacToePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast),
              Icon(Icons.phone_android),
              Icon(Icons.satellite),
              Icon(Icons.watch)
            ],
          )),
          Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 80,
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Start Game'),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
