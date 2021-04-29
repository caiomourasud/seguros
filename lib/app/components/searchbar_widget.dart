import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchBarWidget extends SliverPersistentHeaderDelegate {
  final TextEditingController buscar;
  final FocusNode focus;
  final Function(String) onChange;
  final String? texto;
  SearchBarWidget(
      {required this.buscar,
      required this.focus,
      required this.onChange,
      this.texto = 'Search'});

  @override
  Widget build(context, shrinkOffset, overlapsContent) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0.0, 0.0),
              blurRadius: overlapsContent ? 4.0 : 0.0,
              spreadRadius: -1.0,
              color: Colors.black54,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CupertinoSearchTextField(
              prefixInsets:
                  EdgeInsetsDirectional.fromSTEB(26.0, 10.0, 12.0, 14.0),
              suffixInsets:
                  EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 18.0, 14.0),
              itemSize: 28,
              borderRadius: BorderRadius.circular(50),
              controller: buscar,
              focusNode: focus,
              placeholder: texto,
              onChanged: onChange,
              // onSubmitted: onChange,
              placeholderStyle:
                  TextStyle(color: CupertinoColors.secondaryLabel),
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black87
                      : Theme.of(context).colorScheme.onPrimary),
              itemColor: CupertinoColors.secondaryLabel),
        ),
      );

  @override
  double get maxExtent => 57.2;

  @override
  double get minExtent => 57.2;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
