import 'dart:math';

import 'package:chess/logic/chess_game.dart';
import 'package:chess/logic/move_calculation/move_classes/move_meta.dart';
import 'package:chess/logic/shared_functions.dart';
import 'package:chess/views/components/main_menu_view/game_options/side_picker.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  int aiDifficulty = 1;
  Player selectedSide = Player.player1;
  Player playerSide = Player.player1;
  // bool flip = true;

  ChessGame game;
  bool gameOver = false;
  bool stalemate = false;
  bool promotionRequested = false;
  // bool moveListUpdated = false;
  Player turn = Player.player1;
  List<MoveMeta> moveMetaList = [];

  Player get aiTurn {
    return oppositePlayer(playerSide);
  }

  bool get isAIsTurn {
    return turn == aiTurn;
  }

  void newGame(BuildContext context, {bool notify = true}) {
    if (game != null) {
      game.cancelAIMove();
    }
    gameOver = false;
    stalemate = false;
    turn = Player.player1;
    moveMetaList = [];
    if (selectedSide == Player.random) {
      playerSide =
          Random.secure().nextInt(2) == 0 ? Player.player1 : Player.player2;
    }
    game = ChessGame(this, context);
    if (notify) {
      notifyListeners();
    }
  }

  void exitChessView() {
    game.cancelAIMove();
    notifyListeners();
  }

  void pushMoveMeta(MoveMeta meta) {
    moveMetaList.add(meta);
    notifyListeners();
  }

  void popMoveMeta() {
    moveMetaList.removeLast();
    notifyListeners();
  }

  void endGame() {
    gameOver = true;
    notifyListeners();
  }

  void changeTurn() {
    turn = oppositePlayer(turn);
    notifyListeners();
  }

  void requestPromotion() {
    promotionRequested = true;
    notifyListeners();
  }

  void setAIDifficulty(int difficulty) {
    aiDifficulty = difficulty;
    notifyListeners();
  }

  void setPlayerSide(Player side) {
    selectedSide = side;
    if (side != Player.random) {
      playerSide = side;
    }
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
