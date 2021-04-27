import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomModalBottomSheet {
  show(
          {required BuildContext context,
          required Widget content,
          Widget? trailing,
          required double height}) =>
      showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: height - MediaQuery.of(context).viewPadding.top,
              child: content,
            );
          });
}
