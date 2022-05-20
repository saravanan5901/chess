import 'package:chess/model/app_model.dart';
import 'package:flutter/material.dart';

import 'game_info_and_controls/restart_exit_buttons.dart';

class GameInfoAndControls extends StatelessWidget {
  final AppModel appModel;
  final ScrollController scrollController = ScrollController();

  GameInfoAndControls(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height > 700 ? 204 : 134,
      ),
      child: ListView(
        controller: scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          RestartExitButtons(appModel),
        ],
      ),
    );
  }
}
