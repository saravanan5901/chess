import 'package:flutter/material.dart';

import 'picker.dart';

class AIDifficultyPicker extends StatelessWidget {
  final Map<int, Text> difficultyOptions = {
    1: const Text(
      '1',
      style: TextStyle(color: Colors.black),
    ),
    2: const Text(
      '2',
      style: TextStyle(color: Colors.black),
    ),
    3: const Text(
      '3',
      style: TextStyle(color: Colors.black),
    ),
    4: const Text(
      '4',
      style: TextStyle(color: Colors.black),
    ),
  };

  final int aiDifficulty;
  final Function setFunc;

  AIDifficultyPicker(this.aiDifficulty, this.setFunc, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Picker<int>(
      label: 'AI Difficulty',
      options: difficultyOptions,
      selection: aiDifficulty,
      setFunc: setFunc,
    );
  }
}
