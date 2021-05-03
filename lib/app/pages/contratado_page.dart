import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seguros/app/components/bottom_sheets/adicionar_beneficiarios_buttom.dart';

class ContratadoPage extends StatefulWidget {
  @override
  _ContratadoPageState createState() => _ContratadoPageState();
}

class _ContratadoPageState extends State<ContratadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdicionarBeneficiariosButton(),
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
                  child: Icon(CupertinoIcons.clear,
                      size: 28, color: Colors.grey[600]),
                  onPressed: () => Navigator.of(context).pop()),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.0),
                  Image(
                    image: AssetImage('assets/images/contratado.jpg'),
                    height: 180.0,
                  ),
                  SizedBox(height: 48.0),
                  Text(
                    AppLocalizations.of(context)!.seguroContratado,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  SizedBox(height: 12.0),
                  Opacity(
                    opacity: 0.8,
                    child: Text(AppLocalizations.of(context)!.seguroAtivo,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 20)),
                  ),
                  SizedBox(height: 48.0),
                  RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: AppLocalizations.of(context)!
                                  .consultarDetalhes,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withAlpha(160))),
                          TextSpan(
                              text: AppLocalizations.of(context)!.termos,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 94.0),
          )
        ],
      ),
    );
  }
}
