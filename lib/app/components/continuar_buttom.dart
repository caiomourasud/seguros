import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/pages/simular_seguro_page.dart';

final _appController = Modular.get<AppController>();

final money = new NumberFormat("#,##0.00", "pt_br");

class ContinuarButton extends StatelessWidget {
  final double valor;
  final double? bottomSheetHeight;

  const ContinuarButton(
      {Key? key, this.bottomSheetHeight = 102.0, required this.valor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 0.0),
        Container(
          height: bottomSheetHeight,
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
                    'R\$ ${money.format(valor)} / mês',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Text('Sem tarifas escondidas',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ],
              ),
              CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.purple[800],
                  pressedOpacity: 0.8,
                  padding: EdgeInsets.fromLTRB(26.0, 14.0, 26.0, 14.0),
                  child: Text('Continuar',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white)),
                  onPressed: () => Navigator.push(_appController.context!,
                          CupertinoPageRoute(builder: (context) {
                        return SimularSeguroPage();
                      }))),
            ],
          ),
        ),
        SizedBox(height: 32.0)
      ],
    );
  }
}
