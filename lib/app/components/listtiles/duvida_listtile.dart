import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguros/app/pages/details/duvida_details_page.dart';

class DuvidaListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String text;
  final Function? onTap;
  final bool hasDividerPadding;

  const DuvidaListTile(
      {Key? key,
      this.icon,
      required this.title,
      required this.text,
      this.onTap,
      this.hasDividerPadding = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 24.0,
          leading: icon != null ? Icon(icon!) : null,
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
              SizedBox(height: 4.0),
              Text(text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 17, fontWeight: FontWeight.w300)),
            ],
          ),
          contentPadding: EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 16.0),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.chevron_forward, size: 18),
            ],
          ),
          onTap: () => onTap != null
              ? onTap!()
              : Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return DuvidaDetailsPage(title: title, text: text);
                })),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: hasDividerPadding ? 18.0 : 0.0),
          child: Divider(height: 1.0),
        ),
      ],
    );
  }
}
