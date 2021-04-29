import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

class ContratarButton extends StatelessWidget {
  final double? bottomSheetHeight;

  const ContratarButton({Key? key, this.bottomSheetHeight = 164.0})
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
                child: Text(
                    AppLocalizations.of(_appController.context!)!
                        .contratarSeguro,
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
                    text: AppLocalizations.of(_appController.context!)!
                        .continuarAceita,
                  ),
                  TextSpan(
                      text:
                          AppLocalizations.of(_appController.context!)!.termos,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: '.',
                  ),
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
