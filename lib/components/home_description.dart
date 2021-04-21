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
          height: 72,
          width: 72,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(36))),
          child: Center(
            child: Icon(
              icon,
              color: Colors.grey[700],
              size: 36,
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Text(title,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 24)),
        SizedBox(height: 12.0),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 21, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
