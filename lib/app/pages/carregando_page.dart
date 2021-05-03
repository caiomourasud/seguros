import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'contratado_page.dart';

class CarregandoPage extends StatefulWidget {
  @override
  _CarregandoPageState createState() => _CarregandoPageState();
}

class _CarregandoPageState extends State<CarregandoPage> {
  double progress = 0.2;
  int passo = 0;

  @override
  void initState() {
    carregando();
    super.initState();
  }

  carregando() {
    Timer(Duration(milliseconds: 1200), () {
      setState(() {
        progress = 0.8;
        passo = 1;
      });
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          progress = 1.0;
          passo = 2;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: AnimatedOpacity(
                opacity: passo == 0 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Text(
                  AppLocalizations.of(context)!.enviandoInformacoes,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
            if (passo > 0) SizedBox(height: 48.0),
            if (passo > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: AnimatedOpacity(
                  opacity: passo == 1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    AppLocalizations.of(context)!.trabalhandoNisso,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            if (passo == 2) SizedBox(height: 48.0),
            if (passo == 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: AnimatedOpacity(
                  opacity: passo == 2 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    AppLocalizations.of(context)!.seguroAprovado,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: LinearProgressIndicator(
                minHeight: 4,
                value: progress,
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
