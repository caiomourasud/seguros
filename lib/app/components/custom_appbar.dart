import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seguros/app/pages/home_modal/duvidas_content.dart';
import 'package:seguros/app/pages/view/default_view.dart';

import 'custom_modal_bottom_sheet.dart';

GlobalKey<NavigatorState> modalNavigatorKey = GlobalKey<NavigatorState>();

class CustomSliverAppBar extends StatelessWidget {
  final double value;
  final bool? hasShadow;

  const CustomSliverAppBar(
      {Key? key, required this.value, this.hasShadow = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: hasShadow! ? null : 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: CupertinoButton(
            padding: EdgeInsets.all(4.0),
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.transparent,
            child: Icon(CupertinoIcons.chevron_back,
                size: 28, color: Colors.grey[600]),
            onPressed: () => Navigator.of(context).pop()),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: LinearProgressIndicator(
          minHeight: 2.5,
          value: value,
          color: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.grey[300],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CupertinoButton(
                padding: EdgeInsets.all(4.0),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.transparent,
                child: Icon(CupertinoIcons.question_circle,
                    size: 28, color: Colors.grey[600]),
                onPressed: () => CustomModalBottomSheet().show(
                    context: context,
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewPadding.top,
                    content: DefaultView(
                        navigatorKey: modalNavigatorKey,
                        page: DuvidasContent()))),
          ),
        ),
      ],
    );
  }
}
