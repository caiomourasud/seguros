import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/atividades_modal_bottom_sheet.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/listtiles/atividade_listtille.dart';
import 'package:seguros/app/components/searchbar_widget.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/controllers/atividades_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';

import 'cobertura_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();
final _atividadesController = Modular.get<AtividadesController>();

late FocusNode _focus;
late TextEditingController _buscar;
late ScrollController _scrollController;
double _scrollPosition = 0.0;

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  int atividadeId = 0;

  @override
  void initState() {
    _focus = FocusNode();
    _buscar = TextEditingController();
    _scrollController = ScrollController();
    _focus.addListener(_onFocusChange);
    _scrollController.addListener(_scrollListener);
    _atividadesController.atividades = [];
    Timer(Duration(milliseconds: 500), () {
      _atividadesController.getAtividades();
      Timer(Duration(milliseconds: 300), () {
        AtividadesModalBottomSheet().show(context: context);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    _buscar.dispose();
    _atividadesController.setSearchText('');
    super.dispose();
  }

  _scrollListener() {
    setState(() => _scrollPosition = _scrollController.position.pixels);
  }

  _onFocusChange() {
    _atividadesController.setFocus(_focus.hasFocus);
  }

  AtividadeModel getById(int id) {
    if (id == 0) {
      return AtividadeModel();
    } else {
      var atividade = _atividadesController.atividades
          .where((atividade) => atividade.id == id);
      return atividade.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _atividadesController.atividades.isEmpty
          ? Material(
              child: Center(
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.secondary))))
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                      backgroundColor:
                          atividadeId == 0 ? Colors.grey[350] : null,
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      focusElevation: 0.0,
                      child: Icon(Icons.arrow_forward_rounded,
                          color: atividadeId == 0 ? Colors.grey[500] : null,
                          size: 28),
                      onPressed: atividadeId == 0
                          ? null
                          : () => Navigator.push(_appController.buildContext!,
                                  CupertinoPageRoute(builder: (context) {
                                return CoberturaPage(
                                    atividade: getById(atividadeId));
                              }))),
                  body: Observer(builder: (_) {
                    return CustomScrollView(
                      controller: _scrollController,
                      physics: _atividadesController.onFocus &&
                              _scrollPosition <
                                  (MediaQuery.of(context).size.height * 0.2)
                          ? ClampingScrollPhysics()
                          : AlwaysScrollableScrollPhysics(),
                      slivers: [
                        CustomSliverAppBar(value: 0.25, hasShadow: false),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          sliver: SliverToBoxAdapter(
                            child: Observer(builder: (_) {
                              return AnimatedContainer(
                                height:
                                    _atividadesController.onFocus ? 0.0 : null,
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
                                onChange: (value) => _atividadesController
                                    .setSearchText(value))),
                        SliverToBoxAdapter(
                          child: SizedBox(height: 10.0),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return AtividadeListTile(
                              value: _atividadesController
                                  .filterAtividades[index].id!,
                              title: _atividadesController.setTitle(
                                  context: context,
                                  titles: _atividadesController
                                      .filterAtividades[index].titles!),
                              groupValue: atividadeId,
                              onChange: (value) {
                                setState(() {
                                  atividadeId = value;
                                });
                              },
                            );
                          },
                              childCount: _atividadesController
                                  .filterAtividades.length),
                        )
                      ],
                    );
                  })),
            );
    });
  }
}
