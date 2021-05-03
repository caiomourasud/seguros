import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/components/bottom_sheets/contratar_buttom.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/listtiles/contratar_listtile.dart';
import 'package:seguros/app/components/listtiles/contratar_value_listtile.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seguros/app/controllers/cobertura_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/utils/converters.dart';

final _coberturaController = Modular.get<CoberturaController>();
GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class ContratarPage extends StatefulWidget {
  final AtividadeModel atividade;
  final String formaPagamento;

  const ContratarPage(
      {Key? key, required this.atividade, required this.formaPagamento})
      : super(key: key);
  @override
  _ContratarPageState createState() => _ContratarPageState();
}

class _ContratarPageState extends State<ContratarPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          bottomSheet: ContratarButton(),
          body: CustomScrollView(
            slivers: [
              CustomSliverAppBar(value: 1.0),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text(
                        AppLocalizations.of(context)!.voceVaiPagar +
                            '\n' +
                            Converters().setReal(context) +
                            '\$ ${Converters().moneyFormat(context).format(_coberturaController.valorTotal)} / ' +
                            AppLocalizations.of(context)!.mes,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 31,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Opacity(
                        opacity: 0.8,
                        child: Text(
                            AppLocalizations.of(context)!.semTarifasEscondidas,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                      ),
                    ),
                    SizedBox(height: 22.0),
                    ListTile(
                        minLeadingWidth: 24.0,
                        leading: Icon(CupertinoIcons.money_dollar),
                        title: Text(
                            AppLocalizations.of(context)!.formaPagamento,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(fontSize: 17.9)),
                        contentPadding:
                            EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 16.0),
                        trailing: Text(widget.formaPagamento,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize: 17.9,
                                    fontWeight: FontWeight.w300))),
                    ListTile(
                        minLeadingWidth: 24.0,
                        leading: Icon(Icons.event),
                        title: Text(AppLocalizations.of(context)!.dataPagamento,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(fontSize: 17.9)),
                        contentPadding:
                            EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 16.0),
                        trailing: Text(
                            DateFormat('dd/MM/yyyy').format(DateTime.now()),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize: 17.9,
                                    fontWeight: FontWeight.w300))),
                    Divider(height: 12.0),
                    SizedBox(height: 22.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Opacity(
                        opacity: 0.8,
                        child: Text(
                            AppLocalizations.of(context)!.coberturaMorte,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(height: 22.0),
                    ContratarListTile(
                      title: AppLocalizations.of(context)!.valorCobertura,
                      text: Converters().setReal(context) +
                          '\$ ${Converters().moneyFormat(context).format(_coberturaController.cobertura)}',
                      trailing: Converters().setReal(context) +
                          '\$ ${Converters().moneyFormat(context).format(_coberturaController.setValue(cobertura: _coberturaController.cobertura.toString(), values: widget.atividade.values!))}',
                    ),
                    ContratarListTile(
                      title: AppLocalizations.of(context)!
                          .asssitenciaFuneralDoTitular,
                      text: AppLocalizations.of(context)!
                          .asssitenciaFuneralDoTitularDescription,
                    ),
                    SizedBox(height: 22.0),
                    if (_coberturaController.hospitalizacao ||
                        _coberturaController.invalidez ||
                        _coberturaController.funeralConjugeFilhos ||
                        _coberturaController.funeralPais)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Opacity(
                          opacity: 0.8,
                          child: Text('Coberturas extras',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                        ),
                      ),
                    if (_coberturaController.hospitalizacao ||
                        _coberturaController.invalidez ||
                        _coberturaController.funeralConjugeFilhos ||
                        _coberturaController.funeralPais)
                      SizedBox(height: 22.0),
                    if (_coberturaController.hospitalizacao)
                      ContratarListTile(
                        title: AppLocalizations.of(context)!.hospitalizacao,
                        text: AppLocalizations.of(context)!
                            .hospitalizacaoDescription,
                        trailing: Converters().setReal(context) +
                            '\$ ${Converters().moneyFormat(context).format(_coberturaController.setSimpleValue(cobertura: _coberturaController.cobertura.toString(), values: widget.atividade.taxas!.hospitalizacao!))}',
                      ),
                    if (_coberturaController.invalidez)
                      ContratarListTile(
                        title: AppLocalizations.of(context)!.invalidez,
                        text:
                            AppLocalizations.of(context)!.invalidezDescription,
                        trailing: Converters().setReal(context) +
                            '\$ ${Converters().moneyFormat(context).format(_coberturaController.setValue(cobertura: _coberturaController.cobertura.toString(), values: widget.atividade.taxas!.invalidez!))}',
                      ),
                    if (_coberturaController.funeralConjugeFilhos ||
                        _coberturaController.funeralPais)
                      ContratarListTile(
                        title: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoFamiliares,
                        text: AppLocalizations.of(context)!
                            .asssitenciaFuneralDoFamiliaresDescription,
                        trailing: Converters().setReal(context) +
                            '\$ ${Converters().moneyFormat(context).format(0.0 + (_coberturaController.funeralConjugeFilhos ? _coberturaController.setSimpleValue(cobertura: _coberturaController.cobertura.toString(), values: widget.atividade.taxas!.funeralConjugeFilhos!) : 0.0) + (_coberturaController.funeralPais ? _coberturaController.setSimpleValue(cobertura: _coberturaController.cobertura.toString(), values: widget.atividade.taxas!.funeralPais!) : 0.0))}',
                      ),
                    ContratarValueListTile(
                      text: AppLocalizations.of(context)!.valorLiquido,
                      trailing: Converters().setReal(context) +
                          '\$ ${Converters().moneyFormat(context).format(_coberturaController.valorTotal - _coberturaController.valorTotal * 0.005)}',
                    ),
                    ContratarValueListTile(
                      text: AppLocalizations.of(context)!.valorIOF,
                      trailing: Converters().setReal(context) +
                          '\$ ${Converters().moneyFormat(context).format(_coberturaController.valorTotal * 0.005)}',
                    ),
                    ContratarValueListTile(
                      text: AppLocalizations.of(context)!.pagamentoMensal,
                      trailing: Converters().setReal(context) +
                          '\$ ${Converters().moneyFormat(context).format(_coberturaController.valorTotal)}',
                      isBold: true,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Opacity(
                        opacity: 0.8,
                        child: Text(
                            AppLocalizations.of(context)!.incluso40 +
                                Converters().setReal(context) +
                                '\$ ${Converters().moneyFormat(context).format(_coberturaController.valorTotal * 0.4)}.',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: 15)),
                      ),
                    ),
                    SizedBox(height: 48.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 17),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .dadosColetados,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(160))),
                              TextSpan(
                                  text:
                                      AppLocalizations.of(context)!.privacidade,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => print('onTap')),
                              TextSpan(
                                  text: '.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(160))),
                            ]),
                      ),
                    ),
                    SizedBox(height: 48.0),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
                color: Colors.grey[200],
                child: RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 17),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                AppLocalizations.of(context)!.intermediadoChubb,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(160))),
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .entenderComoFunciona,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('onTap')),
                        TextSpan(
                            text: '.',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(160))),
                      ]),
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 168.0,
                ),
              )
            ],
          )),
    );
  }
}
