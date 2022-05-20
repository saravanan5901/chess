import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

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
          child: MaterialSegmentedControl<T>(
            children: options,
            selectionIndex: selection,
            onSegmentChosen: (T val) {
              setFunc(val);
            },
            selectedColor: const Color(0x60000000),
            unselectedColor: const Color(0x20000000),
            borderColor: const Color(0x20000000),
          ),
          // ),
        )
      ],
    );
  }
}
