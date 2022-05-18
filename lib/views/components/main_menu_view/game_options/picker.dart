import 'package:flutter/cupertino.dart';

class Picker<T> extends StatelessWidget {
  final String label;
  final Map<T, Text> options;
  final T selection;
  final Function setFunc;

  const Picker(
      {Key key, this.label, this.options, this.selection, this.setFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: CupertinoTheme(
            data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'Jura', fontSize: 8),
              ),
            ),
            child: CupertinoSlidingSegmentedControl<T>(
              children: options,
              groupValue: selection,
              onValueChanged: (T val) {
                setFunc(val);
              },
              thumbColor: const Color(0x88FFFFFF),
              backgroundColor: const Color(0x20000000),
            ),
          ),
        )
      ],
    );
  }
}
