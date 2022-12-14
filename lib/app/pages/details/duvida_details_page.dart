import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DuvidaDetailsPage extends StatelessWidget {
  final String title;
  final String text;

  const DuvidaDetailsPage({Key? key, required this.title, required this.text})
      : super(key: key);
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
                              child: Icon(CupertinoIcons.chevron_back,
                                  size: 28, color: Colors.grey[600]),
                              onPressed: () => Navigator.of(context).pop()),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Text('SEGURO DE VIDA',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CupertinoButton(
                                padding: EdgeInsets.all(4.0),
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.transparent,
                                child: Icon(CupertinoIcons.share,
                                    size: 28, color: Colors.grey[600]),
                                onPressed: () {})),
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
                        child: Text(title,
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
                            Text(text,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
