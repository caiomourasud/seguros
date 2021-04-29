import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/descriptions/cobertura_description.dart';
import 'package:seguros/app/components/bottom_sheets/continuar_buttom.dart';
import 'package:seguros/app/components/listtiles/custom_checkbox_listtile.dart';
import 'package:seguros/app/components/custom_track_shape.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/pages/cobertura_modal/hospitalizacao_content.dart';
import 'package:seguros/app/pages/cobertura_modal/invalidez_content.dart';
import 'package:seguros/app/utils/converters.dart';

import 'cobertura_modal/assistenciafuneral_content.dart';
import 'cobertura_modal/assistenciafuneral_familiares_content.dart';
import 'cobertura_modal/mortenatural_content.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class CoberturaPage extends StatefulWidget {
  final AtividadeModel atividade;

  const CoberturaPage({Key? key, required this.atividade}) : super(key: key);
  @override
  _CoberturaPageState createState() => _CoberturaPageState();
}

class _CoberturaPageState extends State<CoberturaPage> {
  double _currentSliderValue = 75000;
  double _valorTotal = 0.0;
  bool _hospitalizacao = false;
  bool _invalidez = false;
  bool _funeralConjugeFilhos = false;
  bool _funeralPais = false;

  @override
  void initState() {
    _valorTotal = valorCobertura(_currentSliderValue);
    super.initState();
  }

  valorCobertura(cobertura) {
    if (cobertura == 50000) {
      return widget.atividade.valor + 1.35;
    } else if (cobertura == 75000) {
      return widget.atividade.valor + 2.36;
    } else if (cobertura == 100000) {
      return widget.atividade.valor + 3.25;
    } else if (cobertura == 125000) {
      return widget.atividade.valor + 4.25;
    } else if (cobertura == 150000) {
      return widget.atividade.valor + 5.25;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          bottomSheet: ContinuarButton(
              valor: _valorTotal,
              cobertura: _currentSliderValue,
              valorCobertura: valorCobertura(_currentSliderValue),
              hospitalizacao: _hospitalizacao,
              invalidez: _invalidez,
              funeralConjugeFilhos: _funeralConjugeFilhos,
              funeralPais: _funeralPais),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
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
                    value: 0.50,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: SizedBox(width: 36.0),
                  )
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 22.0),
                          Text(
                            AppLocalizations.of(context)!.escolhaCobertura,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          SizedBox(height: 48.0),
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                                AppLocalizations.of(context)!
                                    .valorCoberturaMorteTitular,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            Converters().setReal(context) +
                                '\$ ${Converters().moneyFormat(context).format(_currentSliderValue)}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          SizedBox(height: 12.0),
                          SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 5.0,
                                activeTickMarkColor:
                                    Theme.of(context).colorScheme.secondary,
                                activeTrackColor:
                                    Theme.of(context).colorScheme.secondary,
                                thumbColor:
                                    Theme.of(context).colorScheme.secondary,
                                inactiveTrackColor: Colors.grey[300],
                                inactiveTickMarkColor: Colors.grey[300],
                                overlayColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withAlpha(80),
                                trackShape: CustomTrackShape(),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 16.0)),
                            child: Slider(
                              value: _currentSliderValue,
                              min: 50000,
                              max: 150000,
                              divisions: 4,
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                  _valorTotal =
                                      valorCobertura(_currentSliderValue);
                                  _hospitalizacao = false;
                                  _invalidez = false;
                                  _funeralConjugeFilhos = false;
                                  _funeralPais = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Opacity(
                            opacity: 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context)!.cinquentaMil,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                                Text(
                                    AppLocalizations.of(context)!
                                        .centoCinquentaMil,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(height: 22.0)
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CoberturaDescription(
                        subtitle: AppLocalizations.of(context)!
                            .escolhaCoberturaDescription,
                        modalContent: MorteNaturalContent()),
                    CoberturaDescription(
                        title: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoTitular,
                        subtitle: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoTitularDescription,
                        valorAdicional: 0.00,
                        modalContent: AssistenciaFuneralContent()),
                    CoberturaDescription(
                        title: AppLocalizations.of(context)!.hospitalizacao,
                        subtitle: AppLocalizations.of(context)!
                            .hospitalizacaoDescription,
                        valorAdicional: 1.59,
                        switchWidget: Switch.adaptive(
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            value: _hospitalizacao,
                            onChanged: (value) {
                              setState(() {
                                _hospitalizacao = !_hospitalizacao;
                                if (_hospitalizacao) {
                                  _valorTotal = _valorTotal + 1.59;
                                } else {
                                  _valorTotal = _valorTotal - 1.59;
                                }
                              });
                            }),
                        modalContent: HospitalizacaoContent()),
                    CoberturaDescription(
                        title: AppLocalizations.of(context)!.invalidez,
                        subtitle:
                            AppLocalizations.of(context)!.invalidezDescription,
                        hasDivider: false,
                        valorAdicional: 3.03,
                        switchWidget: Switch.adaptive(
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            value: _invalidez,
                            onChanged: (value) {
                              setState(() {
                                _invalidez = !_invalidez;
                                if (_invalidez) {
                                  _valorTotal = _valorTotal + 3.03;
                                } else {
                                  _valorTotal = _valorTotal - 3.03;
                                }
                              });
                            }),
                        modalContent: InvalidezContent()),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6.0),
                      height: 6.0,
                      color: Colors.grey[200],
                    ),
                    CoberturaDescription(
                        title: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoFamiliares,
                        subtitle: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoFamiliaresDescription,
                        hasDivider: false,
                        aditionalWidgets: [
                          CustomCheckBoxListTitle(
                              title:
                                  AppLocalizations.of(context)!.conjugeFilhos,
                              valorAdicional: 1.02,
                              value: _funeralConjugeFilhos,
                              onChange: () {
                                setState(() {
                                  _funeralConjugeFilhos =
                                      !_funeralConjugeFilhos;
                                  if (_funeralConjugeFilhos) {
                                    _valorTotal = _valorTotal + 1.02;
                                  } else {
                                    _valorTotal = _valorTotal - 1.02;
                                  }
                                });
                              }),
                          CustomCheckBoxListTitle(
                              title:
                                  AppLocalizations.of(context)!.paisDoTitular,
                              valorAdicional: 8.23,
                              value: _funeralPais,
                              onChange: () {
                                setState(() {
                                  _funeralPais = !_funeralPais;
                                  if (_funeralPais) {
                                    _valorTotal = _valorTotal + 8.23;
                                  } else {
                                    _valorTotal = _valorTotal - 8.23;
                                  }
                                });
                              }),
                        ],
                        modalContent: AssistenciaFuneralFamiliaresContent()),
                    SizedBox(height: 12.0)
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 106.0),
              ),
            ],
          )),
    );
  }
}
