import 'package:flutter/material.dart';

import '../../shared/rounded_button.dart';

class RoundedAlertButton extends StatelessWidget {
  final String label;
  final Function onConfirm;

  const RoundedAlertButton(this.label, {Key key, @required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(label, onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xff00584f),
            title: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            content: Text(
              'Are you sure you want to ${label.toLowerCase()}?',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
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
