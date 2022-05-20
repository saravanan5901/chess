import 'package:chess/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameStatus extends StatelessWidget {
  const GameStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _getStatus(appModel),
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  String _getStatus(AppModel appModel) {
    if (!appModel.gameOver) {
      if (appModel.isAIsTurn) {
        return 'AI [Level ${appModel.aiDifficulty}] is thinking ';
      } else {
        return 'Your turn';
      }
    } else {
      if (appModel.stalemate) {
        return 'Stalemate';
      } else {
        if (appModel.isAIsTurn) {
          return 'You Win!';
        } else {
          return 'You Lose :(';
        }
      }
    }
  }
}
