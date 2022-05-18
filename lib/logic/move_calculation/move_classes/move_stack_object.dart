import '../../chess_piece.dart';
import 'move.dart';

class MoveStackObject {
  Move move;
  ChessPiece movedPiece;
  ChessPiece takenPiece;
  ChessPiece chessPiece;
  bool castled = false;
  bool promotion = false;
  ChessPieceType promotionType;
  bool chess = false;
  List<List<Move>> possibleOpenings;

  MoveStackObject(this.move, this.movedPiece, this.takenPiece, this.chessPiece,
      this.possibleOpenings);
}
