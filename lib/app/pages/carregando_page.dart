import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seguros/app/components/carregando_text.dart';

import 'contratado_page.dart';

class CarregandoPage extends StatefulWidget {
  @override
  _CarregandoPageState createState() => _CarregandoPageState();
}

class _CarregandoPageState extends State<CarregandoPage> {
  double progress = 0.2;
  int step = 0;

  @override
  void initState() {
    carregando();
    super.initState();
  }

  carregando() {
    Timer(Duration(milliseconds: 1200), () {
      setState(() {
        progress = 0.8;
        step = 1;
      });
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          progress = 1.0;
          step = 2;
        });
        Timer(Duration(milliseconds: 2000), () {
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                  builder: (context) {
                    return ContratadoPage();
                  },
                  fullscreenDialog: true),
              ModalRoute.withName('/'));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          return Future.value(false);
        } else {
          return !Navigator.of(context).userGestureInProgress;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          brightness: Theme.of(context).brightness,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CarregandoText(
              step: step == 0 ? 1.0 : 0.0,
              text: AppLocalizations.of(context)!.enviandoInformacoes,
            ),
            if (step > 0) SizedBox(height: 48.0),
            if (step > 0)
              CarregandoText(
                step: step == 1 ? 1.0 : 0.0,
                text: AppLocalizations.of(context)!.trabalhandoNisso,
              ),
            if (step == 2) SizedBox(height: 48.0),
            if (step == 2)
              CarregandoText(
                step: step == 2 ? 1.0 : 0.0,
                text: AppLocalizations.of(context)!.seguroAprovado,
              ),
            SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: LinearProgressIndicator(
                minHeight: 4,
                value: progress,
                color: Theme.of(context).colorScheme.secondary,
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.bottom + 56.0,
            )
          ],
        ),
      ),
    );
  }
}
