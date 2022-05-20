import 'package:chess/logic/chess_piece.dart';
import 'package:chess/logic/shared_functions.dart';
import 'package:chess/model/app_model.dart';
import 'package:chess/views/components/main_menu_view/game_options/side_picker.dart';
import 'package:flutter/material.dart';

class PromotionOption extends StatelessWidget {
  final AppModel appModel;
  final ChessPieceType promotionType;

  const PromotionOption(this.appModel, this.promotionType, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff00584f),
      ),
      child: Image(
        image: AssetImage(
          'assets/images/pieces/${formatPieceTheme(appModel.pieceTheme)}' +
              '/${pieceTypeToString(promotionType)}_${_playerColor()}.png',
        ),
      ),
      onPressed: () {
        appModel.game.promote(promotionType);
        appModel.update();
        Navigator.pop(context);
      },
    );
  }

  String _playerColor() {
    return appModel.turn == Player.player1 ? 'white' : 'black';
  }
}
