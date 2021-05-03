import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/descriptions/cobertura_description.dart';
import 'package:seguros/app/components/bottom_sheets/continuar_buttom.dart';
import 'package:seguros/app/components/listtiles/custom_checkbox_listtile.dart';
import 'package:seguros/app/components/slider/custum_slider.dart';
import 'package:seguros/app/controllers/cobertura_controller.dart';
import 'package:seguros/app/controllers/atividades_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/pages/cobertura_modal/hospitalizacao_content.dart';
import 'package:seguros/app/pages/cobertura_modal/invalidez_content.dart';
import 'package:seguros/app/utils/converters.dart';

import 'cobertura_modal/assistenciafuneral_content.dart';
import 'cobertura_modal/assistenciafuneral_familiares_content.dart';
import 'cobertura_modal/mortenatural_content.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'formapagamento_page.dart';

final _atividadesController = Modular.get<AtividadesController>();
final _coberturaController = Modular.get<CoberturaController>();

class CoberturaPage extends StatefulWidget {
  final AtividadeModel atividade;

  const CoberturaPage({Key? key, required this.atividade}) : super(key: key);
  @override
  _CoberturaPageState createState() => _CoberturaPageState();
}

class _CoberturaPageState extends State<CoberturaPage> {
  @override
  void initState() {
    _coberturaController.setValorTotal(_coberturaController.setValue(
        cobertura: _coberturaController.cobertura.toString(),
        values: widget.atividade.values!));
    _coberturaController.setCobertura(75000);
    _coberturaController.setHospitalizacao(false);
    _coberturaController.setInvalidez(false);
    _coberturaController.setFuneralConjugeFilhos(false);
    _coberturaController.setFuneralPais(false);
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
                valor: _coberturaController.valorTotal,
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) {
                  return FormaPagamentoPage(atividade: widget.atividade);
                })),
              );
            }),
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(value: 0.50),
                SliverToBoxAdapter(
                  child: Observer(builder: (_) {
                    return AnimatedContainer(
                      height: _atividadesController.onFocus ? 0.0 : null,
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
                                  '\$ ${Converters().moneyFormat(context).format(_coberturaController.cobertura)}',
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
                          CustomSlider(
                            value: _coberturaController.cobertura,
                            onChange: (value) {
                              _coberturaController.setCobertura(value);
                              _coberturaController.setValorTotal(
                                  _coberturaController.setValue(
                                      cobertura: _coberturaController.cobertura
                                          .toString(),
                                      values: widget.atividade.values!));
                              _coberturaController.setHospitalizacao(false);
                              _coberturaController.setInvalidez(false);
                              _coberturaController
                                  .setFuneralConjugeFilhos(false);
                              _coberturaController.setFuneralPais(false);
                            },
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
                      Observer(builder: (_) {
                        return CoberturaDescription(
                            title: AppLocalizations.of(context)!.hospitalizacao,
                            subtitle: AppLocalizations.of(context)!
                                .hospitalizacaoDescription,
                            valorAdicional: _coberturaController.setSimpleValue(
                                cobertura:
                                    _coberturaController.cobertura.toString(),
                                values:
                                    widget.atividade.taxas!.hospitalizacao!),
                            switchWidget: Switch.adaptive(
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                value: _coberturaController.hospitalizacao,
                                onChanged: (value) {
                                  _coberturaController.setHospitalizacao(
                                      !_coberturaController.hospitalizacao);
                                  _coberturaController.onSelect(
                                      item: _coberturaController.hospitalizacao,
                                      simpleValues: widget
                                          .atividade.taxas!.hospitalizacao!);
                                }),
                            modalContent: HospitalizacaoContent());
                      }),
                      Observer(builder: (_) {
                        return CoberturaDescription(
                            title: AppLocalizations.of(context)!.invalidez,
                            subtitle: AppLocalizations.of(context)!
                                .invalidezDescription,
                            hasDivider: false,
                            valorAdicional: _coberturaController.setValue(
                                cobertura:
                                    _coberturaController.cobertura.toString(),
                                values: widget.atividade.taxas!.invalidez!),
                            switchWidget: Switch.adaptive(
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                value: _coberturaController.invalidez,
                                onChanged: (value) {
                                  _coberturaController.setInvalidez(
                                      !_coberturaController.invalidez);
                                  _coberturaController.onSelect(
                                      item: _coberturaController.invalidez,
                                      values:
                                          widget.atividade.taxas!.invalidez!);
                                }),
                            modalContent: InvalidezContent());
                      }),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6.0),
                        height: 6.0,
                        color: Colors.grey[200],
                      ),
                      Observer(builder: (_) {
                        return CoberturaDescription(
                            title: AppLocalizations.of(context)!
                                .asssitenciaFuneralDoFamiliares,
                            subtitle: AppLocalizations.of(context)!
                                .asssitenciaFuneralDoFamiliaresDescription,
                            hasDivider: false,
                            aditionalWidgets: [
                              CustomCheckBoxListTitle(
                                  title: AppLocalizations.of(context)!
                                      .conjugeFilhos,
                                  valorAdicional:
                                      _coberturaController.setSimpleValue(
                                          cobertura: _coberturaController
                                              .cobertura
                                              .toString(),
                                          values: widget.atividade.taxas!
                                              .funeralConjugeFilhos!),
                                  value:
                                      _coberturaController.funeralConjugeFilhos,
                                  onChange: () {
                                    _coberturaController
                                        .setFuneralConjugeFilhos(
                                            !_coberturaController
                                                .funeralConjugeFilhos);
                                    _coberturaController.onSelect(
                                        item: _coberturaController
                                            .funeralConjugeFilhos,
                                        simpleValues: widget.atividade.taxas!
                                            .funeralConjugeFilhos!);
                                  }),
                              CustomCheckBoxListTitle(
                                  title: AppLocalizations.of(context)!
                                      .paisDoTitular,
                                  valorAdicional:
                                      _coberturaController.setSimpleValue(
                                          cobertura: _coberturaController
                                              .cobertura
                                              .toString(),
                                          values: widget
                                              .atividade.taxas!.funeralPais!),
                                  value: _coberturaController.funeralPais,
                                  onChange: () {
                                    _coberturaController.setFuneralPais(
                                        !_coberturaController.funeralPais);
                                    _coberturaController.onSelect(
                                        item: _coberturaController.funeralPais,
                                        simpleValues: widget
                                            .atividade.taxas!.funeralPais!);
                                  }),
                            ],
                            modalContent:
                                AssistenciaFuneralFamiliaresContent());
                      }),
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
