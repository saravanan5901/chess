import 'package:chess/logic/chess_piece.dart';
import 'package:chess/model/app_model.dart';
import 'package:chess/views/components/main_menu_view/game_options/side_picker.dart';

int tileToRow(int tile) {
  return (tile / 8).floor();
}

int tileToCol(int tile) {
  return tile % 8;
}

double getXFromTile(int tile, double tileSize, AppModel appModel) {
  return appModel.playerSide == Player.player2
      ? (7 - tileToCol(tile)) * tileSize
      : tileToCol(tile) * tileSize;
}

double getYFromTile(int tile, double tileSize, AppModel appModel) {
  return appModel.playerSide == Player.player2
      ? (7 - tileToRow(tile)) * tileSize
      : tileToRow(tile) * tileSize;
}

Player oppositePlayer(Player player) {
  return player == Player.player1 ? Player.player2 : Player.player1;
}

String pieceTypeToString(ChessPieceType type) {
  return type.toString().substring(type.toString().indexOf('.') + 1);
}
