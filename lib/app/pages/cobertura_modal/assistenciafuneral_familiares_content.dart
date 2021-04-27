import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/app/controllers/app_controller.dart';
import 'package:seguros/app/pages/home_modal/duvidas_content.dart';

final _appController = Modular.get<AppController>();

class AssistenciaFuneralFamiliaresContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 52.0,
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.transparent,
                height: 68.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CupertinoButton(
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.transparent,
                              child: Icon(CupertinoIcons.clear,
                                  size: 28, color: Colors.grey[600]),
                              onPressed: () =>
                                  Navigator.of(_appController.context!).pop()),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CupertinoButton(
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.transparent,
                              child: Icon(CupertinoIcons.question_circle,
                                  size: 28, color: Colors.grey[600]),
                              onPressed: () => Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return DuvidasContent(backButton: true);
                                  }))),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView(
                    padding: EdgeInsets.only(top: 24.0),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Assistência funeral do titular',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 32)),
                      ),
                      SizedBox(
                        height: 72.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('O que é',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(fontSize: 19)),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                                "Curabitur auctor ipsum cursus risus molestie lobortis. ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      Divider(height: 64.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Como funciona',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(fontSize: 19)),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                                "Curabitur auctor ipsum cursus risus molestie lobortis. "
                                "Ut rutrum est sit amet velit ullamcorper dictum. "
                                "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Curabitur auctor ipsum cursus risus molestie lobortis. ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      Divider(height: 64.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cobertura',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(fontSize: 19)),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                                "Curabitur auctor ipsum cursus risus molestie lobortis. "
                                "Ut rutrum est sit amet velit ullamcorper dictum. "
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      Divider(height: 64.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Período de carência',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(fontSize: 19)),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text("Lorem ipsum dolor sit amet elit.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      Divider(height: 64.0)
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
