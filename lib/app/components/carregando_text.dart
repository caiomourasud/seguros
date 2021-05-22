import 'package:flutter/material.dart';

class CarregandoText extends StatelessWidget {
  final double step;
  final String text;

  const CarregandoText({Key? key, required this.step, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: AnimatedOpacity(
        opacity: step,
        duration: Duration(milliseconds: 300),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
