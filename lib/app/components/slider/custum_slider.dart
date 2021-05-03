import 'package:flutter/material.dart';

import 'custom_track_shape.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final Function(double) onChange;

  const CustomSlider({Key? key, required this.value, required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 5.0,
          activeTickMarkColor: Theme.of(context).colorScheme.secondary,
          activeTrackColor: Theme.of(context).colorScheme.secondary,
          thumbColor: Theme.of(context).colorScheme.secondary,
          inactiveTrackColor: Colors.grey[300],
          inactiveTickMarkColor: Colors.grey[300],
          overlayColor: Theme.of(context).colorScheme.secondary.withAlpha(80),
          trackShape: CustomTrackShape(),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0)),
      child: Slider(
        value: value,
        min: 50000,
        max: 150000,
        divisions: 4,
        onChanged: (double value) {
          onChange(value);
        },
      ),
    );
  }
}
