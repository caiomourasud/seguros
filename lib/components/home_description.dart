import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDescription extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const HomeDescription(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child: Center(
            child: Icon(
              icon,
              color: Colors.grey[800],
              size: 34,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(title,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 22)),
        SizedBox(height: 10.0),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
