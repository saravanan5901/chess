import 'package:flutter/material.dart';

import 'picker.dart';

enum Player { player1, player2, random }

class SidePicker extends StatelessWidget {
  final Map<Player, Text> colorOptions = const <Player, Text>{
    Player.player1: Text(
      'White',
      style: TextStyle(color: Colors.black),
    ),
    Player.player2: Text(
      'Black',
      style: TextStyle(color: Colors.black),
    ),
    Player.random: Text(
      'Random',
      style: TextStyle(color: Colors.black),
    )
  };

  final Player playerSide;
  final Function setFunc;

  const SidePicker(this.playerSide, this.setFunc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Picker<Player>(
      label: 'Side',
      options: colorOptions,
      selection: playerSide,
      setFunc: setFunc,
    );
  }
}
