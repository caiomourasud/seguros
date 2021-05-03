import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seguros/app/pages/carregando_page.dart';

final _appController = Modular.get<AppController>();

bool contratar = false;

class ContratarButton extends StatefulWidget {
  final double? bottomSheetHeight;

  const ContratarButton({Key? key, this.bottomSheetHeight = 164.0})
      : super(key: key);

  @override
  _ContratarButtonState createState() => _ContratarButtonState();
}

class _ContratarButtonState extends State<ContratarButton> {
  @override
  void initState() {
    contratar = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.bottomSheetHeight,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: widget.bottomSheetHeight! * 0.03),
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
                child: contratar
                    ? Center(
                        child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ))
                    : Text(
                        AppLocalizations.of(_appController.context!)!
                            .contratarSeguro,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white)),
                onPressed: () {
                  setState(() => contratar = true);
                  Timer(Duration(milliseconds: 500), () {
                    Navigator.push(_appController.context!,
                        CupertinoPageRoute(builder: (context) {
                      return CarregandoPage();
                    }));
                  });
                }),
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
                          fontWeight: FontWeight.bold),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => print('onTap')),
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
