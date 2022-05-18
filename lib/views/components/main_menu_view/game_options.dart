import 'package:chess/model/app_model.dart';
import 'package:flutter/cupertino.dart';

import 'game_options/ai_difficulty_picker.dart';
import 'game_options/side_picker.dart';

class GameOptions extends StatelessWidget {
  final AppModel appModel;

  const GameOptions(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 20),
          AIDifficultyPicker(
            appModel.aiDifficulty,
            appModel.setAIDifficulty,
          ),
          const SizedBox(height: 20),
          SidePicker(
            appModel.selectedSide,
            appModel.setPlayerSide,
          ),
        ],
      ),
    );
  }
}
