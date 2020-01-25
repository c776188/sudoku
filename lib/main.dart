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

class TTTButton {
  final id;
  String text;
  bool enabled;

  TTTButton({this.id, this.text = "", this.enabled = true});
}

class _TicTacToePageState extends State<TicTacToePage> {
  bool player = true; // true == O, false == X

  List<TTTButton> tButtons;

  void initState() {
    tButtons = <TTTButton>[
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
      new TTTButton(),
    ];
  }

  void _playGame(index) {
    setState(() {
      if (!tButtons[index].enabled) {
        return;
      }

      tButtons[index].enabled = false;
      tButtons[index].text = player ? "O" : "X";
      player = !player;
    });
  }

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
                      tButtons[index].enabled ? "" : tButtons[index].text,
                      style: TextStyle(fontSize: 50.0),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                    onPressed: () {
                      _playGame(index);
                    },
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
