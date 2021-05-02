import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/descriptions/cobertura_description.dart';
import 'package:seguros/app/components/bottom_sheets/continuar_buttom.dart';
import 'package:seguros/app/components/listtiles/custom_checkbox_listtile.dart';
import 'package:seguros/app/components/custom_track_shape.dart';
import 'package:seguros/app/controllers/cobertura_controller.dart';
import 'package:seguros/app/controllers/simular_seguro_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/pages/cobertura_modal/hospitalizacao_content.dart';
import 'package:seguros/app/pages/cobertura_modal/invalidez_content.dart';
import 'package:seguros/app/utils/converters.dart';

import 'cobertura_modal/assistenciafuneral_content.dart';
import 'cobertura_modal/assistenciafuneral_familiares_content.dart';
import 'cobertura_modal/mortenatural_content.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'formapagamento_page.dart';

final _simularSeguroController = Modular.get<SimularSeguroController>();
final _coberturaController = Modular.get<CoberturaController>();

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
    _valorTotal = _coberturaController.setValue(
        cobertura: _currentSliderValue.toString(),
        values: widget.atividade.values!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: GestureDetector(
        child: Scaffold(
            bottomSheet: Observer(builder: (_) {
              return ContinuarButton(
                valor: _valorTotal,
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) {
                  return FormaPagamentoPage(
                      atividade: widget.atividade,
                      valor: _valorTotal,
                      cobertura: _currentSliderValue,
                      hospitalizacao: _hospitalizacao,
                      invalidez: _invalidez,
                      funeralConjugeFilhos: _funeralConjugeFilhos,
                      funeralPais: _funeralPais);
                })),
              );
            }),
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(value: 0.50),
                SliverToBoxAdapter(
                  child: Observer(builder: (_) {
                    return AnimatedContainer(
                      height: _simularSeguroController.onFocus ? 0.0 : null,
                      duration: Duration(milliseconds: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 22.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Text(
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
                          ),
                          SizedBox(height: 48.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Opacity(
                              opacity: 0.8,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .valorCoberturaMorteTitular,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Text(
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
                                  _valorTotal = _coberturaController.setValue(
                                      cobertura: _currentSliderValue.toString(),
                                      values: widget.atividade.values!);
                                  _hospitalizacao = false;
                                  _invalidez = false;
                                  _funeralConjugeFilhos = false;
                                  _funeralPais = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Opacity(
                              opacity: 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .cinquentaMil,
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
                          ),
                          SizedBox(height: 22.0)
                        ],
                      ),
                    );
                  }),
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
                          valorAdicional: _coberturaController.setSimpleValue(
                              cobertura: _currentSliderValue.toString(),
                              values: widget.atividade.taxas!.hospitalizacao!),
                          switchWidget: Switch.adaptive(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              value: _hospitalizacao,
                              onChanged: (value) {
                                setState(() {
                                  _hospitalizacao = !_hospitalizacao;
                                  if (_hospitalizacao) {
                                    _valorTotal = _valorTotal +
                                        _coberturaController.setSimpleValue(
                                            cobertura:
                                                _currentSliderValue.toString(),
                                            values: widget.atividade.taxas!
                                                .hospitalizacao!);
                                  } else {
                                    _valorTotal = _valorTotal -
                                        _coberturaController.setSimpleValue(
                                            cobertura:
                                                _currentSliderValue.toString(),
                                            values: widget.atividade.taxas!
                                                .hospitalizacao!);
                                  }
                                });
                              }),
                          modalContent: HospitalizacaoContent()),
                      CoberturaDescription(
                          title: AppLocalizations.of(context)!.invalidez,
                          subtitle: AppLocalizations.of(context)!
                              .invalidezDescription,
                          hasDivider: false,
                          valorAdicional: _coberturaController.setValue(
                              cobertura: _currentSliderValue.toString(),
                              values: widget.atividade.taxas!.invalidez!),
                          switchWidget: Switch.adaptive(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              value: _invalidez,
                              onChanged: (value) {
                                setState(() {
                                  _invalidez = !_invalidez;
                                  if (_invalidez) {
                                    _valorTotal = _valorTotal +
                                        _coberturaController.setValue(
                                            cobertura:
                                                _currentSliderValue.toString(),
                                            values: widget
                                                .atividade.taxas!.invalidez!);
                                  } else {
                                    _valorTotal = _valorTotal -
                                        _coberturaController.setValue(
                                            cobertura:
                                                _currentSliderValue.toString(),
                                            values: widget
                                                .atividade.taxas!.invalidez!);
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
                                valorAdicional:
                                    _coberturaController.setSimpleValue(
                                        cobertura:
                                            _currentSliderValue.toString(),
                                        values: widget.atividade.taxas!
                                            .funeralConjugeFilhos!),
                                value: _funeralConjugeFilhos,
                                onChange: () {
                                  setState(() {
                                    _funeralConjugeFilhos =
                                        !_funeralConjugeFilhos;
                                    if (_funeralConjugeFilhos) {
                                      _valorTotal = _valorTotal +
                                          _coberturaController.setSimpleValue(
                                              cobertura: _currentSliderValue
                                                  .toString(),
                                              values: widget.atividade.taxas!
                                                  .funeralConjugeFilhos!);
                                    } else {
                                      _valorTotal = _valorTotal -
                                          _coberturaController.setSimpleValue(
                                              cobertura: _currentSliderValue
                                                  .toString(),
                                              values: widget.atividade.taxas!
                                                  .funeralConjugeFilhos!);
                                    }
                                  });
                                }),
                            CustomCheckBoxListTitle(
                                title:
                                    AppLocalizations.of(context)!.paisDoTitular,
                                valorAdicional:
                                    _coberturaController.setSimpleValue(
                                        cobertura:
                                            _currentSliderValue.toString(),
                                        values: widget
                                            .atividade.taxas!.funeralPais!),
                                value: _funeralPais,
                                onChange: () {
                                  setState(() {
                                    _funeralPais = !_funeralPais;
                                    if (_funeralPais) {
                                      _valorTotal = _valorTotal +
                                          _coberturaController.setSimpleValue(
                                              cobertura: _currentSliderValue
                                                  .toString(),
                                              values: widget.atividade.taxas!
                                                  .funeralPais!);
                                    } else {
                                      _valorTotal = _valorTotal -
                                          _coberturaController.setSimpleValue(
                                              cobertura: _currentSliderValue
                                                  .toString(),
                                              values: widget.atividade.taxas!
                                                  .funeralPais!);
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
      ),
    );
  }
}
