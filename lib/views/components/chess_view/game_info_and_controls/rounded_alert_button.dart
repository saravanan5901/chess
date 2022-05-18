import 'package:flutter/cupertino.dart';

import '../../shared/rounded_button.dart';

class RoundedAlertButton extends StatelessWidget {
  final String label;
  final Function onConfirm;

  const RoundedAlertButton(this.label, {Key key, @required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(label, onPressed: () {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Jura',
                color: CupertinoColors.black,
              ),
            ),
            content: Text(
              'Are you sure you want to ${label.toLowerCase()}?',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Jura',
                color: CupertinoColors.black,
              ),
            ),
            actions: [
              CupertinoButton(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Jura',
                    color: CupertinoColors.destructiveRed,
                  ),
                ),
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
              ),
              CupertinoButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Jura',
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }
}
