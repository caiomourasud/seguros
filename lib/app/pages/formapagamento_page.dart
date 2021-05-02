import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/components/custom_appbar.dart';
import 'package:seguros/app/components/listtiles/duvida_listtile.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/utils/converters.dart';

import 'contratar_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

class FormaPagamentoPage extends StatefulWidget {
  final AtividadeModel atividade;
  final double valor;
  final double cobertura;
  final bool hospitalizacao;
  final bool invalidez;
  final bool funeralConjugeFilhos;
  final bool funeralPais;

  const FormaPagamentoPage(
      {Key? key,
      required this.atividade,
      required this.valor,
      required this.cobertura,
      required this.hospitalizacao,
      required this.invalidez,
      required this.funeralConjugeFilhos,
      required this.funeralPais})
      : super(key: key);
  @override
  _FormaPagamentoPageState createState() => _FormaPagamentoPageState();
}

class _FormaPagamentoPageState extends State<FormaPagamentoPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(value: 0.75),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    AppLocalizations.of(context)!.escolhaFormaPagamento,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: 30,
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
                        AppLocalizations.of(context)!
                            .escolhaFormaPagamentoDescription,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w300)),
                  ),
                ),
                SizedBox(height: 22.0),
                DuvidaListTile(
                    hasDividerPadding: false,
                    icon: CupertinoIcons.creditcard,
                    title: AppLocalizations.of(context)!.cartaoNubank,
                    text: AppLocalizations.of(context)!.vencimentoEm +
                        DateFormat('dd MMM',
                                Localizations.localeOf(context).toString())
                            .format(DateTime.now())
                            .toUpperCase(),
                    onTap: () {
                      Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return ContratarPage(
                            atividade: widget.atividade,
                            valor: widget.valor,
                            formaPagamento:
                                AppLocalizations.of(context)!.cartaoCredito,
                            cobertura: widget.cobertura,
                            hospitalizacao: widget.hospitalizacao,
                            invalidez: widget.invalidez,
                            funeralConjugeFilhos: widget.funeralConjugeFilhos,
                            funeralPais: widget.funeralPais);
                      }));
                    }),
                DuvidaListTile(
                    hasDividerPadding: false,
                    icon: CupertinoIcons.money_dollar,
                    title: AppLocalizations.of(context)!.contaNubank,
                    text: AppLocalizations.of(context)!.saldoAtual +
                        Converters().setReal(context) +
                        '\$ ${Converters().moneyFormat(context).format(516.12)}',
                    onTap: () {
                      Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return ContratarPage(
                            atividade: widget.atividade,
                            valor: widget.valor,
                            formaPagamento:
                                AppLocalizations.of(context)!.contaNubank,
                            cobertura: widget.cobertura,
                            hospitalizacao: widget.hospitalizacao,
                            invalidez: widget.invalidez,
                            funeralConjugeFilhos: widget.funeralConjugeFilhos,
                            funeralPais: widget.funeralPais);
                      }));
                    }),
                SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(AppLocalizations.of(context)!.revisarDetalhes,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w300)),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
