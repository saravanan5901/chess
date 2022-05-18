import 'package:chess/model/app_model.dart';
import 'package:chess/views/components/shared/rounded_button.dart';
import 'package:flutter/cupertino.dart';

import '../../chess_view.dart';

class MainMenuButtons extends StatelessWidget {
  final AppModel appModel;

  const MainMenuButtons(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RoundedButton(
        'Start',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) {
                appModel.newGame(context, notify: false);
                return ChessView(appModel);
              },
            ),
          );
        },
      ),
    );
  }
}
