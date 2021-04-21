import 'package:flutter/material.dart';

class SimularButton extends StatelessWidget {
  final double? bottomSheetHeight;

  const SimularButton({Key? key, this.bottomSheetHeight = 94.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheetHeight,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: bottomSheetHeight! * 0.03),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              primary: Colors.white,
              backgroundColor: Colors.purple[800],
              onSurface: Colors.purple[900]),
          child: Text('Simular meu seguro',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white)),
          onPressed: () {}),
    );
  }
}
