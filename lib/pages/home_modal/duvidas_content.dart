import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/components/duvida_listtile.dart';
import 'package:seguros/controllers/app_controller.dart';

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
              color: Theme.of(context).canvasColor,
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
                              child: Text('SEGURO DE VIDA',
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
                  child: ListView(padding: EdgeInsets.zero, children: [
                    //Padding(
                    //  padding: EdgeInsets.symmetric(horizontal: 18.0),
                    //  child: Text('Dúvidas comuns sobre seguro de vida',
                    //      style: Theme.of(context)
                    //          .textTheme
                    //          .headline6
                    //          ?.copyWith(fontSize: 32)),
                    //),
                    //SizedBox(
                    //  height: 32.0,
                    //),
                    DuvidaListTile(
                        title: 'O que Nubank Vida?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
                    DuvidaListTile(
                        title:
                            'Não estou encontrando o Nubank Vida no meu aplicativo Nubank. Como faço para ter acesso?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
                    DuvidaListTile(
                        title:
                            'Como meus beneficiários acionam o seguro de vida?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
                    DuvidaListTile(
                        title: 'Quem deveria ter um seguro de vida?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
                    DuvidaListTile(
                        title:
                            'Esse seguro de vida cobre doenças geralmente excluídas?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
                    DuvidaListTile(
                        title: 'Quais as vantagens do Nubank Vida?',
                        text:
                            'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.'),
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
