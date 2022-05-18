import 'dart:math';

import 'package:chess/logic/chess_game.dart';
import 'package:chess/logic/move_calculation/move_classes/move_meta.dart';
import 'package:chess/logic/shared_functions.dart';
import 'package:chess/views/components/main_menu_view/game_options/side_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_themes.dart';

class AppModel extends ChangeNotifier {
  int aiDifficulty = 1;
  Player selectedSide = Player.player1;
  Player playerSide = Player.player1;
  int timeLimit = 0;
  String pieceTheme = 'Classic';
  String themeName = 'Green';
  bool flip = true;

  ChessGame game;
  bool gameOver = false;
  bool stalemate = false;
  bool promotionRequested = false;
  bool moveListUpdated = false;
  Player turn = Player.player1;
  List<MoveMeta> moveMetaList = [];

  AppTheme get theme {
    return themeList[themeIndex];
  }

  int get themeIndex {
    var themeIndex = 0;
    themeList.asMap().forEach((index, theme) {
      if (theme.name == themeName) {
        themeIndex = index;
      }
    });
    return themeIndex;
  }

  Player get aiTurn {
    return oppositePlayer(playerSide);
  }

  bool get isAIsTurn {
    return turn == aiTurn;
  }

  AppModel() {
    loadSharedPrefs();
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
    moveListUpdated = true;
    notifyListeners();
  }

  void popMoveMeta() {
    moveMetaList.removeLast();
    moveListUpdated = true;
    notifyListeners();
  }

  void endGame() {
    gameOver = true;
    notifyListeners();
  }

  void undoEndGame() {
    gameOver = false;
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

  void setTheme(int index) async {
    themeName = themeList[index].name;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeName', themeName);
    notifyListeners();
  }

  void setFlipBoard(bool flip) async {
    final prefs = await SharedPreferences.getInstance();
    this.flip = flip;
    prefs.setBool('flip', flip);
    notifyListeners();
  }

  void loadSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    themeName = prefs.getString('themeName') ?? 'Green';
    pieceTheme = prefs.getString('pieceTheme') ?? 'Classic';
    flip = prefs.getBool('flip') ?? true;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
