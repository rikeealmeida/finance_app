import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  const AdaptativeButton({Key key, this.label, this.onPressed})
      : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(child: Text(label), onPressed: onPressed)
        : ElevatedButton(child: Text(label), onPressed: onPressed);
  }
}
