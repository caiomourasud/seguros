import 'package:flutter/material.dart';

class ContratarValueListTile extends StatelessWidget {
  final String text;
  final String trailing;
  final bool? isBold;

  const ContratarValueListTile(
      {Key? key,
      required this.text,
      required this.trailing,
      this.isBold = false})
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
                Opacity(
                  opacity: 0.8,
                  child: Text(text,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 17,
                          fontWeight: isBold! ? FontWeight.bold : null)),
                ),
              ],
            ),
            contentPadding: EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 16.0),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(trailing,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 17.9,
                        fontWeight: isBold! ? FontWeight.bold : null))
              ],
            )),
        Divider(height: 1.0)
      ],
    );
  }
}
