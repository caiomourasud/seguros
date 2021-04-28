import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/components/duvida_listtile.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'contratar_page.dart';

final _appController = Modular.get<AppController>();

final money = new NumberFormat("#,##0.00", "pt_br");

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class FormaPagamentoPage extends StatefulWidget {
  final double valor;
  final double cobertura;
  final double valorCobertura;
  final bool hospitalizacao;
  final bool invalidez;
  final bool funeralConjugeFilhos;
  final bool funeralPais;

  const FormaPagamentoPage(
      {Key? key,
      required this.valor,
      required this.cobertura,
      required this.valorCobertura,
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
                value: 0.75,
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    'Escolha a forma de pagamento',
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
                        'A cobrança é feita, mensalmente, através da forma de pagamento que você escolher.',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w300)),
                  ),
                ),
                SizedBox(height: 22.0),
                DuvidaListTile(
                    hasDividerPadding: false,
                    icon: CupertinoIcons.creditcard,
                    title: 'Cartão de crédito Nubank',
                    text: 'Vencimento da fatura em 12 MAI',
                    onTap: () {
                      Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return ContratarPage(
                            valor: widget.valor,
                            formaPagamento: 'Cartão de crédito',
                            cobertura: widget.cobertura,
                            valorCobertura: widget.valorCobertura,
                            hospitalizacao: widget.hospitalizacao,
                            invalidez: widget.invalidez,
                            funeralConjugeFilhos: widget.funeralConjugeFilhos,
                            funeralPais: widget.funeralPais);
                      }));
                    }),
                DuvidaListTile(
                    hasDividerPadding: false,
                    icon: CupertinoIcons.money_dollar,
                    title: 'Conta Nubank',
                    text: 'Seu saldo atual é de R\$ 511,12',
                    onTap: () {
                      Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return ContratarPage(
                            valor: widget.valor,
                            formaPagamento: 'Conta Nubank',
                            cobertura: widget.cobertura,
                            valorCobertura: widget.valorCobertura,
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
                    child: Text(
                        'Você poderá revisar os detalhes de seu seguro de vida mais tarde.',
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
