import 'package:carrosweb/colors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class RequiredLabel extends StatelessWidget {
  final String label;
  final bool required;

  RequiredLabel(this.label, this.required);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AppText(
          label,
          bold: true,
          color: AppColors.texto,
        ),
        required
            ? Row(
                children: <Widget>[
                  SizedBox(width: 6),
                  AppText("*", color: Colors.red),
                ],
              )
            : Container(),
      ],
    );
  }
}
