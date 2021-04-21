import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguros/pages/details/duvida_details_page.dart';

class DuvidaListTile extends StatelessWidget {
  final String title;
  final String text;

  const DuvidaListTile({Key? key, required this.title, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 19)),
              Text(text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 17, fontWeight: FontWeight.w300)),
            ],
          ),
          contentPadding: EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.chevron_forward, size: 18),
            ],
          ),
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return DuvidaDetailsPage(title: title, text: text);
            }));
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(height: 1.0),
        ),
      ],
    );
  }
}
