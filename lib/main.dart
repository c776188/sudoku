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
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(9, (index) {
              return Container(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "X",
                      style: TextStyle(fontSize: 50.0),
                    ),
                    color: Colors.grey, // 設置背景色
                    textColor: Colors.white, // 設置文字顏色
                    onPressed: () {}, // enable按鈕),
                  ));
            }),
          ),
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
