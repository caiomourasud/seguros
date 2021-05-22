import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool contratar = false;

class GenericButton extends StatefulWidget {
  final String text;
  final Widget? subtitle;
  final bool? hasIndicator;
  final Function onPressed;

  const GenericButton(
      {Key? key,
      required this.text,
      this.subtitle,
      this.hasIndicator = false,
      required this.onPressed})
      : super(key: key);

  @override
  _GenericButtonState createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  void initState() {
    contratar = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: CupertinoButton(
                padding: widget.subtitle != null
                    ? null
                    : EdgeInsets.symmetric(vertical: 20.0),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Theme.of(context).colorScheme.secondary,
                pressedOpacity: 0.8,
                child: contratar
                    ? Center(
                        child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ))
                    : Text(widget.text,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white)),
                onPressed: () {
                  if (widget.hasIndicator!) {
                    setState(() => contratar = true);
                    Timer(Duration(milliseconds: 500), () {
                      widget.onPressed();
                    });
                  } else {
                    widget.onPressed();
                  }
                }),
          ),
          if (widget.subtitle != null)
            SizedBox(
              height: 16.0,
            ),
          if (widget.subtitle != null) widget.subtitle!,
          SizedBox(
            height: widget.subtitle != null ? 22.0 : 8.0,
          ),
        ],
      ),
    );
  }
}
