import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/components/bottom_sheet/contratar_buttom.dart';
import 'package:seguros/app/components/contratar_listtile.dart';
import 'package:seguros/app/components/contratar_value_listtile.dart';

final money = new NumberFormat("#,##0.00", "pt_br");

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class ContratarPage extends StatefulWidget {
  final double valor;
  final String formaPagamento;
  final double cobertura;
  final double valorCobertura;
  final bool hospitalizacao;
  final bool invalidez;
  final bool funeralConjugeFilhos;
  final bool funeralPais;

  const ContratarPage(
      {Key? key,
      required this.valor,
      required this.formaPagamento,
      required this.cobertura,
      required this.valorCobertura,
      required this.hospitalizacao,
      required this.invalidez,
      required this.funeralConjugeFilhos,
      required this.funeralPais})
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
                    value: 1.0,
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
                        'Você vai pagar \nR\$ ${money.format(widget.valor)} / mês',
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
                        child: Text('Sem tarifas escondidas',
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
                        title: Text('Forma de \npagamento',
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
                        title: Text('Data de pagamento',
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
                        child: Text('Cobertura por morte',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(height: 22.0),
                    ContratarListTile(
                      title: 'Valor da cobertura',
                      text: 'R\$ ${money.format(widget.cobertura)}',
                      trailing: 'R\$ ${money.format(widget.valorCobertura)}',
                    ),
                    ContratarListTile(
                      title: 'Assistência funeral do titular',
                      text:
                          'R\$ ${money.format(5000)} de cobertura para prestação do serviço funeral ou reembolso dos custos.',
                    ),
                    SizedBox(height: 22.0),
                    if (widget.hospitalizacao ||
                        widget.invalidez ||
                        widget.funeralConjugeFilhos ||
                        widget.funeralPais)
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
                    if (widget.hospitalizacao ||
                        widget.invalidez ||
                        widget.funeralConjugeFilhos ||
                        widget.funeralPais)
                      SizedBox(height: 22.0),
                    if (widget.hospitalizacao)
                      ContratarListTile(
                        title: 'Hospitalização',
                        text:
                            'Caso sofra algum acidente e precise ficar no hospital por pelo menos 48h, você recebe uma diária de R\$ 150,00 para usar como quiser.',
                        trailing: 'R\$ ${money.format(1.59)}',
                      ),
                    if (widget.invalidez)
                      ContratarListTile(
                        title: 'Invalidez',
                        text:
                            'Receba até 100% do valor da cobertura total do seu seguro no caso de invalidez total ou parcial por acidente.',
                        trailing: 'R\$ ${money.format(3.03)}',
                      ),
                    if (widget.funeralConjugeFilhos || widget.funeralPais)
                      ContratarListTile(
                        title: 'Assistência funeral de familiares',
                        text:
                            'É possível escolher entre a prestação do serviço funeral ou reembolso dos custos de R\$ 5.000,00 de cobertura, para cada familiar.',
                        trailing:
                            'R\$ ${money.format(0.0 + (widget.funeralConjugeFilhos ? 1.02 : 0.0) + (widget.funeralPais ? 8.23 : 0.0))}',
                      ),
                    ContratarValueListTile(
                      text: 'Valor líquido',
                      trailing: 'R\$ ${money.format(widget.valor - 0.08)}',
                    ),
                    ContratarValueListTile(
                      text: 'Valor IOF',
                      trailing: 'R\$ ${money.format(0.08)}',
                    ),
                    ContratarValueListTile(
                      text: 'Pagamento mensal',
                      trailing: 'R\$ ${money.format(widget.valor)}',
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
                            'Já está incluso nesse valor a remuneração do Nubank, que é uma taxa de 40% do pagamento mensal líquido, igual a R\$ ${money.format(widget.valor * 0.4)}.',
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
                                  text:
                                      'Coletamos seus dados para lhe oferecer seguro de vida. Para verificar mais detalhes, acesse a ',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(160))),
                              TextSpan(
                                  text: 'política de privacidade.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold)),
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
                                'Este seguro é intermediado pelo Nubank e a seguradora responsável é a Chubb, empresa com operação em mais de 50 países além do Brasil. ',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(160))),
                        TextSpan(
                            text: 'Entender como isso funciona.',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold)),
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
