import 'package:flutter/material.dart';
import 'package:seguros/app/utils/converters.dart';

class CustomCheckBoxListTitle extends StatelessWidget {
  final String title;
  final double valorAdicional;
  final bool value;
  final Function onChange;

  const CustomCheckBoxListTitle(
      {Key? key,
      required this.title,
      required this.valorAdicional,
      required this.value,
      required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          onChange();
        },
        contentPadding: EdgeInsets.fromLTRB(12.0, 4.0, 22.0, 4.0),
        leading: Transform.scale(
          scale: 1.6,
          child: Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: value,
            onChanged: (value) {
              onChange();
            },
          ),
        ),
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 17.8, fontWeight: FontWeight.w500)),
        trailing: Container(
            decoration: new BoxDecoration(
              color: Colors.grey[200],
              borderRadius: new BorderRadius.all(Radius.circular(4.0)),
            ),
            padding: EdgeInsets.all(4.0),
            child: Text('+ ' +
                Converters().setReal(context) +
                '\$ ${Converters().moneyFormat(context).format(valorAdicional)}')));
  }
}
