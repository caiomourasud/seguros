import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/controllers/app_controller.dart';

final _appController = Modular.get<AppController>();

class DuvidasContent extends StatelessWidget {
  final bool? backButton;

  const DuvidasContent({Key? key, this.backButton = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(16.0),
        topRight: const Radius.circular(16.0),
      ),
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
                            )
                          ]))),
              Expanded(
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('Dúvidas comuns sobre seguro de vida',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 32)),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('O que Nubank Vida?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(height: 1.0),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Não estou encontrando o Nubank Vida no meu aplicativo Nubank. Como faço para ter acesso?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Como meus beneficiários acionam o seguro de vida?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(height: 1.0),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Quem deveria ter um seguro de vida?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(height: 1.0),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Esse seguro de vida cobre doenças geralmente excluídas?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(height: 1.0),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Quais as vantagens do Nubank Vida?',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 19)),
                          Text(
                              "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300)),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chevron_forward, size: 18),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(height: 1.0),
                    ),
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
