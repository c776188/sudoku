import 'package:flutter/material.dart';
import './GameButton.dart';
import 'dart:developer';

class TicTacToePage extends StatefulWidget {
  TicTacToePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  bool player = true; // true == O, false == X

  List<TTTButton> tButtons;

  @override
  void initState() {
    super.initState();
    player = true;
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

  // click button
  void _clickOX(index) {
    setState(() {
      if (!tButtons[index].enabled) {
        return;
      }

      tButtons[index].enabled = false;
      tButtons[index].text = player ? "O" : "X";
      player = !player;
      _checkWin(index);
    });
  }

  void _checkWin(index) {
    String winText = "";

    int row = (index / 3).toInt();
    int col = index % 3;

    // check row
    if (tButtons[row * 3].text == tButtons[row * 3 + 1].text &&
        tButtons[row * 3].text == tButtons[row * 3 + 2].text) {
      winText = tButtons[row * 3].text;
    }

    // check column
    if (tButtons[col + 3 * 0].text == tButtons[col + 3 * 1].text &&
        tButtons[col + 3 * 0].text == tButtons[col + 3 * 2].text) {
      winText = tButtons[col * 3].text;
    }

    // check \
    if (index == 4 &&
        tButtons[index].text == tButtons[0].text &&
        tButtons[index].text == tButtons[8].text) {
      winText = tButtons[index].text;
    }

    // check /
    if (index == 4 &&
        tButtons[index].text == tButtons[2].text &&
        tButtons[index].text == tButtons[6].text) {
      winText = tButtons[index].text;
    }

    if (winText != "") {
      // show winner msg
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(winText + ' WIN!'));
          });

      // restart
      initState();
    }
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
                      _clickOX(index);
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
                child: Text('Restart'),
                onPressed: () {
                  setState(() {
                    initState();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
