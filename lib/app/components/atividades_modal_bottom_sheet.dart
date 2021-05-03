import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';

final _appController = Modular.get<AppController>();

class AtividadesModalBottomSheet {
  show({required BuildContext context}) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CupertinoButton(
                    padding: EdgeInsets.all(4.0),
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.transparent,
                    child: Icon(CupertinoIcons.clear,
                        size: 28, color: Colors.grey[600]),
                    onPressed: () => Navigator.of(context).pop()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.0),
                  Text(
                    AppLocalizations.of(_appController.context!)!
                        .porqueImportante,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  SizedBox(height: 12.0),
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                        AppLocalizations.of(_appController.context!)!
                            .importanteProfissao,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 20)),
                  ),
                  SizedBox(height: 22.0),
                  Container(
                    height: 94.0,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 94.0 * 0.03),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: CupertinoButton(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey[350],
                        pressedOpacity: 0.8,
                        child: Text(
                            AppLocalizations.of(_appController.context!)!
                                .continuar,
                            style: Theme.of(context).textTheme.headline6),
                        onPressed: () => Navigator.of(context).pop()),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewPadding.bottom)
                ],
              ),
            ),
          ],
        );
      });
}
