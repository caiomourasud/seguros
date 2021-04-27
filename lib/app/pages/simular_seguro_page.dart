import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/atividade_listtille.dart';
import 'package:seguros/app/components/custom_modal_bottom_sheet.dart';
import 'package:seguros/app/components/searchbar_widget.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'cobertura_page.dart';
import 'home_modal/duvidas_content.dart';
import 'view/default_view.dart';

final _appController = Modular.get<AppController>();

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

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
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _appController.setSearchText('');
    super.dispose();
  }

  _onFocusChange() {
    _appController.setFocus(_focus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: atividade == 0 ? Colors.grey[350] : null,
              elevation: 0.0,
              highlightElevation: 0.0,
              focusElevation: 0.0,
              child: Icon(Icons.arrow_forward_rounded,
                  color: atividade == 0 ? Colors.grey[500] : null, size: 28),
              onPressed: atividade == 0
                  ? null
                  : () => Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return CoberturaPage(
                            atividade:
                                _appController.atividades[atividade - 1]);
                      }))),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0.0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CupertinoButton(
                      padding: EdgeInsets.all(4.0),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.transparent,
                      child: Icon(CupertinoIcons.chevron_back,
                          size: 28, color: Colors.grey[600]),
                      onPressed: () => Navigator.of(context).pop()),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    minHeight: 2.5,
                    value: 0.25,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CupertinoButton(
                          padding: EdgeInsets.all(4.0),
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.transparent,
                          child: Icon(CupertinoIcons.question_circle,
                              size: 28, color: Colors.grey[600]),
                          onPressed: () => CustomModalBottomSheet().show(
                              context: context,
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).viewPadding.top,
                              content: DefaultView(
                                  navigatorKey: modalNavigatorKey,
                                  page: DuvidasContent()))),
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                sliver: SliverToBoxAdapter(
                  child: Observer(builder: (_) {
                    return AnimatedContainer(
                      height: _appController.onFocus ? 0.0 : null,
                      duration: Duration(milliseconds: 1000),
                      child: Column(
                        children: [
                          SizedBox(height: 22.0),
                          Text(
                            'Qual é a sua atividade profissional?',
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
                                'Selecione sua profissão atual na lista abaixo. É importante selecionar a atividade correta, pois isso interfere na sua proposta e na validação do contrato.',
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: SearchBarWidget(
                        texto: 'Buscar "comerciante"',
                        buscar: _buscar,
                        focus: _focus,
                        onChange: (value) =>
                            _appController.setSearchText(value))),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10.0),
              ),
              SliverToBoxAdapter(
                child: Observer(builder: (_) {
                  return Column(
                    children: _appController.filterAtividades
                        .map(
                          (item) => AtividadeListTile(
                            value: item.value,
                            title: item.title,
                            groupValue: atividade,
                            onChange: (value) {
                              setState(() {
                                atividade = value;
                              });
                            },
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
            ],
          )),
    );
  }
}
