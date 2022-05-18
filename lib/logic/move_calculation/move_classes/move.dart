import 'package:chess/logic/chess_piece.dart';

class Move {
  int from;
  int to;
  ChessPieceType promotionType;

  Move(this.from, this.to, {this.promotionType = ChessPieceType.promotion});

  @override
  bool operator ==(move) => from == move.from && to == move.to;

  @override
  int get hashCode => super.hashCode;
}
