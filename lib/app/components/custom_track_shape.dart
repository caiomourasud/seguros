import 'package:flutter/material.dart';

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = 4.0;
    final double trackLeft = 22.0;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 44.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
