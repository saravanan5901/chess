import 'package:chess/logic/chess_piece.dart';
import 'package:chess/model/app_model.dart';
import 'package:chess/views/components/chess_view/promotion_option.dart';
import 'package:flutter/material.dart';

const promotions = [
  ChessPieceType.queen,
  ChessPieceType.rook,
  ChessPieceType.bishop,
  ChessPieceType.knight
];

class PromotionDialog extends StatelessWidget {
  final AppModel appModel;

  const PromotionDialog(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      actions: [
        SizedBox(
          height: 66,
          child: Row(
            children: promotions
                .map(
                  (promotionType) => PromotionOption(
                    appModel,
                    promotionType,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
