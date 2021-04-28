import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContratarListTile extends StatelessWidget {
  final String title;
  final String text;
  final String? trailing;

  const ContratarListTile(
      {Key? key, required this.title, required this.text, this.trailing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 17)),
                SizedBox(height: 4.0),
                Opacity(
                  opacity: 0.8,
                  child: Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 15)),
                ),
              ],
            ),
            contentPadding: EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 16.0),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                trailing == null
                    ? Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(4.0)),
                        ),
                        padding: EdgeInsets.all(4.0),
                        child: Text('Incluído'))
                    : Text(trailing!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 21, fontWeight: FontWeight.w400))
              ],
            )),
        Divider(height: 1.0)
      ],
    );
  }
}
