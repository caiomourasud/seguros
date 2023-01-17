import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, adm }

class AtividadeListTile extends StatelessWidget {
  final int groupValue;
  final int value;
  final String title;
  final Function(int) onChange;

  const AtividadeListTile(
      {Key? key,
      required this.groupValue,
      required this.value,
      required this.title,
      required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 4.0, 10.0),
          leading: Transform.scale(
              scale: 1.5,
              child: Radio<int>(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: value,
                  groupValue: groupValue,
                  onChanged: (int? value) {
                    onChange(value!);
                  })),
          title: Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          onTap: () {
            onChange(value);
          },
        ),
        Divider(height: 1.0)
      ],
    );
  }
}
