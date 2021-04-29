import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/listtiles/duvida_listtile.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

class DuvidasContent extends StatelessWidget {
  final bool? backButton;

  const DuvidasContent({Key? key, this.backButton = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 52.0,
            ),
          ),
          Column(
            children: [
              Container(
                  color: Colors.transparent,
                  height: 68.0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: CupertinoButton(
                                  padding: EdgeInsets.all(4.0),
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.transparent,
                                  child: Icon(
                                      backButton!
                                          ? CupertinoIcons.chevron_back
                                          : CupertinoIcons.clear,
                                      size: 28,
                                      color: Colors.grey[600]),
                                  onPressed: () => backButton!
                                      ? Navigator.of(context).pop()
                                      : Navigator.of(_appController.context!)
                                          .pop()),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Text(
                                  AppLocalizations.of(_appController.context!)!
                                      .seguroDeVida
                                      .toUpperCase(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: CupertinoButton(
                                  padding: EdgeInsets.all(4.0),
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.transparent,
                                  child: Icon(
                                      backButton!
                                          ? CupertinoIcons.chevron_back
                                          : CupertinoIcons.clear,
                                      size: 28,
                                      color: Colors.grey[600]),
                                  onPressed: null),
                            )
                          ]))),
              Expanded(
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView(padding: EdgeInsets.zero, children: [
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .oQueEnubankVida,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum2),
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .naoEncontro,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum1),
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .comoBeneficiariosAcionam,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum3),
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .quemDeveriaTerSeguro,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum2),
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .seguroCobreDoencasExcludas,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum2),
                    DuvidaListTile(
                        title: AppLocalizations.of(_appController.context!)!
                            .quaisVantagens,
                        text: AppLocalizations.of(_appController.context!)!
                            .loremIpsum2),
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.bottom,
                    )
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
