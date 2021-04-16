import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seguros/components/cached_image_widget.dart';
import 'package:seguros/components/home_description.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bottomSheetHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          height: bottomSheetHeight,
          child: Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    primary: Colors.white,
                    backgroundColor: Colors.purple[800],
                    onSurface: Colors.purple[900],
                    padding: EdgeInsets.fromLTRB(80.0, 22.0, 80.0, 22.0)),
                child: Text('Simular meu seguro'),
                onPressed: () {}),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CachedImageWidget(
                  url:
                      'https://blog.nubank.com.br/wp-content/uploads/2020/11/4_header.png'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 22.0),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nubank Vida',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    SizedBox(height: 22.0),
                    Text(
                        'Finalmente um seguto de vida simples e acessível para você, com transparência em todas as etapas.',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 19)),
                    SizedBox(height: 8.0),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text('Conhecer mais',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                        color: Theme.of(context).accentColor)),
                            SizedBox(width: 8.0),
                            Icon(CupertinoIcons.arrow_right)
                          ],
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    SizedBox(height: 26.0),
                    HomeDescription(
                        icon: CupertinoIcons.device_phone_portrait,
                        title: 'Simples como deve ser',
                        subtitle:
                            'Tudo feito de um jeito para que você saiba exatamente o que está contratando.'),
                    SizedBox(height: 26.0),
                    HomeDescription(
                        icon: CupertinoIcons.money_dollar,
                        title: 'Preço que cabe no bolso',
                        subtitle:
                            'Preço médio inicial de R\$9 por mês, sem tarifas escondidas e sem ajustes de preço por idade durante 5 anos. Simples assim.'),
                    SizedBox(height: 26.0),
                    HomeDescription(
                        icon: CupertinoIcons.pencil_ellipsis_rectangle,
                        title: 'Coberturas Personalizáveis e úteis para você',
                        subtitle:
                            'Monte seu seguro com coberturas que fazem a diferença para você e para o seu momento de vida.'),
                    SizedBox(height: 26.0),
                    HomeDescription(
                        icon: CupertinoIcons.phone,
                        title: 'Se você precisar, estaremos aqui',
                        subtitle:
                            'Facilidade para adicionar o seguro pelo aplicativo ou telefone, com um time 100% dedicado a realmente te dar suporte se você precisar.')
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 36.0),
            ),
            SliverToBoxAdapter(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
              color: Colors.grey[300],
              child: Text(
                  'A aceitação do seguro estará sujeira à análise do risco.',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.grey[700], fontWeight: FontWeight.w300)),
            )),
            SliverToBoxAdapter(
              child: SizedBox(height: bottomSheetHeight),
            )
          ],
        ));
  }
}
