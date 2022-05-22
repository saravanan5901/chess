import 'package:chess/model/app_model.dart';
import 'package:chess/views/main_menu_view.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: const MyApp(),
    ),
  );
  _loadFlameAssets();
}

void _loadFlameAssets() async {
  List<String> pieceImages = [];
  for (var color in ['black', 'white']) {
    for (var piece in ['king', 'queen', 'rook', 'bishop', 'knight', 'pawn']) {
      pieceImages.add('pieces/classic/${piece}_$color.png');
    }
  }
  await Flame.images.loadAll(pieceImages);
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chess',
      home: MainMenuView(),
    );
  }
}
