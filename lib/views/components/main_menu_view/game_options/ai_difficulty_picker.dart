import 'package:flutter/cupertino.dart';

import 'picker.dart';

class AIDifficultyPicker extends StatelessWidget {
  final Map<int, Text> difficultyOptions = {
    1: const Text('1'),
    2: const Text('2'),
    3: const Text('3'),
    4: const Text('4'),
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
