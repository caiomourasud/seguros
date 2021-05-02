import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/listtiles/atividade_listtille.dart';
import 'package:seguros/app/components/searchbar_widget.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/controllers/simular_seguro_controller.dart';

import 'cobertura_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();
final _simularSeguroController = Modular.get<SimularSeguroController>();

late ScrollController _scrollController;
double _scrollPosition = 0.0;
late FocusNode _focus;
late TextEditingController _buscar;

class SimularSeguroPage extends StatefulWidget {
  @override
  _SimularSeguroPageState createState() => _SimularSeguroPageState();
}

class _SimularSeguroPageState extends State<SimularSeguroPage> {
  int atividade = 0;

  @override
  void initState() {
    _focus = FocusNode();
    _buscar = TextEditingController();
    _scrollController = ScrollController();
    _focus.addListener(_onFocusChange);
    _scrollController.addListener(_scrollListener);
    _simularSeguroController.atividades = [];
    Timer(Duration(milliseconds: 300), () {
      _simularSeguroController.getAtividades();
    });

    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    _buscar.dispose();
    _simularSeguroController.setSearchText('');
    super.dispose();
  }

  _scrollListener() {
    setState(() => _scrollPosition = _scrollController.position.pixels);
  }

  _onFocusChange() {
    _simularSeguroController.setFocus(_focus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _simularSeguroController.atividades.isEmpty
          ? Material(child: Center(child: CircularProgressIndicator()))
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: atividade == 0 ? Colors.grey[350] : null,
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      focusElevation: 0.0,
                      child: Icon(Icons.arrow_forward_rounded,
                          color: atividade == 0 ? Colors.grey[500] : null,
                          size: 28),
                      onPressed: atividade == 0
                          ? null
                          : () => Navigator.push(_appController.context!,
                                  CupertinoPageRoute(builder: (context) {
                                return CoberturaPage(
                                    atividade: _simularSeguroController
                                        .atividades[atividade - 1]);
                              }))),
                  body: Observer(builder: (_) {
                    return CustomScrollView(
                      controller: _scrollController,
                      physics: _simularSeguroController.onFocus &&
                              _scrollPosition <
                                  (MediaQuery.of(context).size.height * 0.2)
                          ? ClampingScrollPhysics()
                          : AlwaysScrollableScrollPhysics(),
                      slivers: [
                        CustomSliverAppBar(value: 0.25),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          sliver: SliverToBoxAdapter(
                            child: Observer(builder: (_) {
                              return AnimatedContainer(
                                height: _simularSeguroController.onFocus
                                    ? 0.0
                                    : null,
                                duration: Duration(milliseconds: 1000),
                                child: Column(
                                  children: [
                                    SizedBox(height: 22.0),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .qualAtividade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface),
                                    ),
                                    SizedBox(height: 12.0),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .qualAtividadeDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300)),
                                    ),
                                    SizedBox(height: 32.0),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SliverPersistentHeader(
                            pinned: true,
                            floating: false,
                            delegate: SearchBarWidget(
                                texto: AppLocalizations.of(context)!
                                    .buscarComerciante,
                                buscar: _buscar,
                                focus: _focus,
                                onChange: (value) => _simularSeguroController
                                    .setSearchText(value))),
                        SliverToBoxAdapter(
                          child: SizedBox(height: 10.0),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return AtividadeListTile(
                              value: _simularSeguroController
                                  .filterAtividades[index].id!,
                              title: _simularSeguroController.setTitle(
                                  context: context,
                                  titles: _simularSeguroController
                                      .filterAtividades[index].titles!),
                              groupValue: atividade,
                              onChange: (value) {
                                setState(() {
                                  atividade = value;
                                });
                              },
                            );
                          },
                              childCount: _simularSeguroController
                                  .filterAtividades.length),
                        )
                      ],
                    );
                  })),
            );
    });
  }
}
