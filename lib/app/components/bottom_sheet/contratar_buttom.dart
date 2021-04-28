import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContratarButton extends StatelessWidget {
  final double? bottomSheetHeight;

  const ContratarButton({Key? key, this.bottomSheetHeight = 158.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheetHeight,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: bottomSheetHeight! * 0.03),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.purple[800],
                pressedOpacity: 0.8,
                child: Text('Contratar seguro',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white)),
                onPressed: () {}),
          ),
          SizedBox(
            height: 22.0,
          ),
          RichText(
            text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Ao continuar, você aceita os ',
                  ),
                  TextSpan(
                      text: 'Termos e condições.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold)),
                ]),
          ),
          SizedBox(
            height: 22.0,
          ),
        ],
      ),
    );
  }
}
