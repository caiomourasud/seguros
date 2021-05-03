import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/pages/atividades_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

class AdicionarBeneficiariosButton extends StatelessWidget {
  final double? bottomSheetHeight;

  const AdicionarBeneficiariosButton({Key? key, this.bottomSheetHeight = 94.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheetHeight,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: bottomSheetHeight! * 0.03),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
      child: CupertinoButton(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.purple[800],
          pressedOpacity: 0.8,
          child: Text(
              AppLocalizations.of(_appController.context!)!
                  .adicionarBeneficiarios,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white)),
          onPressed: () => Navigator.push(_appController.context!,
                  CupertinoPageRoute(builder: (context) {
                return AtividadesPage();
              }))),
    );
  }
}
