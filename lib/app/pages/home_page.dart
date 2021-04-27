import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/cached_image_widget.dart';
import 'package:seguros/app/components/custom_modal_bottom_sheet.dart';
import 'package:seguros/app/components/home_description.dart';
import 'package:seguros/app/components/simular_buttom.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'home_modal/conhecer_content.dart';
import 'home_modal/duvidas_content.dart';
import 'view/default_view.dart';

final _appController = Modular.get<AppController>();

late ScrollController _scrollController;
double _scrollPosition = 0.0;
double _bottomSheetHeight = 94.0;
double _imageHeight = 248.0;

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _appController.setContext(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    setState(() => _scrollPosition = _scrollController.position.pixels);
  }

  @override
  Widget build(BuildContext context) {
    double _systemPeddingTop = MediaQuery.of(context).viewPadding.top;
    double _systemPeddingBottom = MediaQuery.of(context).viewPadding.bottom;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                toolbarHeight: 0.0,
                brightness:
                    _scrollPosition < (_imageHeight - _systemPeddingBottom)
                        ? Brightness.dark
                        : Brightness.light,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              extendBodyBehindAppBar: true,
              bottomSheet: SimularButton(),
              body: CustomScrollView(
                controller: _scrollController,
                physics:
                    _scrollPosition < (MediaQuery.of(context).size.height * 0.6)
                        ? ClampingScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Container(
                          constraints: BoxConstraints(minHeight: _imageHeight),
                          child: CachedImageWidget(
                              url:
                                  'https://blog.nubank.com.br/wp-content/uploads/2020/11/4_header.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: _systemPeddingTop + 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: CupertinoButton(
                                    padding: EdgeInsets.all(4.0),
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.grey[900]?.withAlpha(150),
                                    child: Icon(CupertinoIcons.question_circle,
                                        size: 30, color: Colors.white),
                                    onPressed: () => CustomModalBottomSheet()
                                        .show(
                                            context: context,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                MediaQuery.of(context)
                                                    .viewPadding
                                                    .top,
                                            content: DefaultView(
                                                navigatorKey: modalNavigatorKey,
                                                page: DuvidasContent()))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 48.0),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nubank Vida',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          SizedBox(height: 32.0),
                          Text(
                              'Finalmente um seguro de vida simples e acessível para você, com transparência em todas as etapas.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 21)),
                          SizedBox(height: 16.0),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Conhecer mais',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.copyWith(
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .accentColor)),
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
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Colors.transparent,
                                          child: Icon(
                                              CupertinoIcons.question_circle,
                                              size: 30,
                                              color: Colors.grey[600]),
                                          onPressed: () {}),
                                    ),
                                    content: DefaultView(
                                        navigatorKey: modalNavigatorKey,
                                        page: ConhecerContent()))),
                          ),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.device_phone_portrait,
                              title: 'Simples como deve ser',
                              subtitle:
                                  'Tudo feito de um jeito para que você saiba exatamente o que está contratando.'),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.money_dollar,
                              title: 'Preço que cabe no bolso',
                              subtitle:
                                  'Preço médio inicial de R\$9 por mês, sem tarifas escondidas e sem ajustes de preço por idade durante 5 anos. Simples assim.'),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.pencil_ellipsis_rectangle,
                              title:
                                  'Coberturas Personalizáveis e úteis para você',
                              subtitle:
                                  'Monte seu seguro com coberturas que fazem a diferença para você e para o seu momento de vida.'),
                          SizedBox(height: 42.0),
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
                    child: SizedBox(height: 42.0),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                    color: Colors.grey[200],
                    child: Text(
                        'A aceitação do seguro estará sujeira à análise do risco.',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 19,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w300)),
                  )),
                  SliverToBoxAdapter(
                    child: SizedBox(height: _bottomSheetHeight + 6.0),
                  )
                ],
              )),
          AnimatedOpacity(
            opacity: _scrollPosition < _imageHeight - _systemPeddingBottom
                ? 0.0
                : 1.0,
            duration: Duration(milliseconds: 200),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: _systemPeddingTop,
            ),
          ),
        ],
      ),
    );
  }
}
