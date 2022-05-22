import 'package:chess/model/app_model.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ChessBoardWidget extends StatelessWidget {
  final AppModel appModel;

  const ChessBoardWidget(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffffffff),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x88000000),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 68,
          height: MediaQuery.of(context).size.width - 68,
          child: GameWidget(game: appModel.game),
        ),
      ),
    );
  }
}
