import 'package:flutter/material.dart';
import './TicTacToe/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GameHome(),
    );
  }
}

class GameHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Home'),
      ),
      body: Center(
        child: ButtonTheme(
          minWidth: 200,
          height: 80,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.blue,
            child: Text('Tic Tac Toe'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TicTacToePage(title: 'Tic Tac Toe Page')),
              );
            },
          ),
        ),
      ),
    );
  }
}
