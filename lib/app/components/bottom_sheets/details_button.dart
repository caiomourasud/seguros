import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seguros/app/utils/converters.dart';

final _appController = Modular.get<AppController>();

class DetailsButton extends StatelessWidget {
  final double valor;
  final Function onPressed;

  const DetailsButton({
    Key? key,
    required this.onPressed,
    required this.valor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 0.0),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Converters().setReal(context) +
                        '\$ ${Converters().moneyFormat(context).format(valor)} / ' +
                        AppLocalizations.of(_appController.buildContext!)!.mes,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                        AppLocalizations.of(_appController.buildContext!)!
                            .semTarifasEscondidas,
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ],
              ),
              CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Theme.of(context).colorScheme.secondary,
                  pressedOpacity: 0.8,
                  padding: EdgeInsets.fromLTRB(26.0, 14.0, 26.0, 14.0),
                  child: Text(
                      AppLocalizations.of(_appController.buildContext!)!
                          .continuar,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white)),
                  onPressed: () => onPressed()),
            ],
          ),
        ),
        SizedBox(height: 32.0)
      ],
    );
  }
}
