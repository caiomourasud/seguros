import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/pages/view/default_view.dart';

import 'custom_modal_bottom_sheet.dart';

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

final money = new NumberFormat("#,##0.00", "pt_br");

class CoberturaDescription extends StatelessWidget {
  final String? title;
  final String subtitle;
  final double? valorAdicional;
  final List<Widget>? aditionalWidgets;
  final Widget modalContent;
  final Widget? switchWidget;
  final bool? hasDivider;

  const CoberturaDescription(
      {Key? key,
      this.title,
      required this.subtitle,
      this.valorAdicional,
      this.aditionalWidgets,
      required this.modalContent,
      this.switchWidget,
      this.hasDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(title!,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 17.8, fontWeight: FontWeight.w500)),
                  if (valorAdicional != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            decoration: new BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(4.0)),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Text(valorAdicional == 0.0
                                ? 'Incluído'
                                : '+ R\$ ${money.format(valorAdicional)}')),
                        if (switchWidget != null) SizedBox(width: 8.0),
                        if (switchWidget != null) switchWidget!
                      ],
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: SizedBox(height: switchWidget != null ? 16.0 : 28.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Opacity(
                opacity: 0.8,
                child: Text(subtitle,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 17.8, fontWeight: FontWeight.w300)),
              ),
            ),
            if (aditionalWidgets != null)
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  children: aditionalWidgets!,
                ),
              ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ver detalhes',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).accentColor)),
                        SizedBox(width: 8.0),
                        Icon(Icons.arrow_forward_rounded, size: 22),
                      ],
                    ),
                    onPressed: () => CustomModalBottomSheet().show(
                        context: context,
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).viewPadding.top,
                        trailing: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CupertinoButton(
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.transparent,
                              child: Icon(CupertinoIcons.question_circle,
                                  size: 30, color: Colors.grey[600]),
                              onPressed: () {}),
                        ),
                        content: DefaultView(
                            navigatorKey: modalNavigatorKey,
                            page: modalContent))),
              ),
            ),
            SizedBox(height: 32.0)
          ],
        ),
        if (hasDivider!) Divider(height: 12.0)
      ],
    );
  }
}
