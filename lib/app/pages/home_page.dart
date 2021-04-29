import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/components/cached_image_widget.dart';
import 'package:seguros/app/components/custom_modal_bottom_sheet.dart';
import 'package:seguros/app/components/descriptions/home_description.dart';
import 'package:seguros/app/components/bottom_sheets/simular_buttom.dart';
import 'package:seguros/app/controllers/app_controller.dart';

import 'home_modal/conhecer_content.dart';
import 'home_modal/duvidas_content.dart';
import 'view/default_view.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                            AppLocalizations.of(context)!.nubankVida,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          SizedBox(height: 32.0),
                          Text(AppLocalizations.of(context)!.seguroSimples,
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
                                    Text(
                                        AppLocalizations.of(context)!
                                            .conhecerMais,
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
                              title: AppLocalizations.of(context)!.simples,
                              subtitle: AppLocalizations.of(context)!
                                  .simplesDescription),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.money_dollar,
                              title: AppLocalizations.of(context)!.precoBolso,
                              subtitle: AppLocalizations.of(context)!
                                  .precoBolsoDescription),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.pencil_ellipsis_rectangle,
                              title: AppLocalizations.of(context)!
                                  .coberturasPersonalizaveis,
                              subtitle: AppLocalizations.of(context)!
                                  .coberturasPersonalizaveisDescription),
                          SizedBox(height: 42.0),
                          HomeDescription(
                              icon: CupertinoIcons.phone,
                              title: AppLocalizations.of(context)!.sePrecisar,
                              subtitle: AppLocalizations.of(context)!
                                  .sePrecisarDescription)
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
                    child: Text(AppLocalizations.of(context)!.analiseRisco,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 19,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(160),
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
