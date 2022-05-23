import 'package:chess/model/app_model.dart';
import 'package:chess/views/components/main_menu_view/game_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chess/views/components/shared/rounded_button.dart';

import 'package:chess/views/chess_view.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({Key key}) : super(key: key);

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppModel>(
        builder: (context, appModel, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFC9B28F),
                  Color(0xFF69493b),
                ],
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(
                        10, MediaQuery.of(context).padding.top + 10, 10, 0),
                    child: const Text(
                      'Chess App',
                      style: TextStyle(fontSize: 40),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage(
                    'assets/images/logo.jpg',
                  ),
                  height: 200,
                  width: double.maxFinite,
                ),
                const SizedBox(
                  height: 20,
                ),
                GameOptions(appModel),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RoundedButton(
                    'Start',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            appModel.newGame(context, notify: false);
                            return ChessView(appModel);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
