import 'package:carrosweb/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgress;
  final bool whiteMode;

  AppButton(this.text,
      {this.onPressed, this.showProgress = false, this.whiteMode = false});

  @override
  Widget build(BuildContext context) {
    Color background = whiteMode ? AppColors.bg : AppColors.texto;
    Color textColor = whiteMode ? AppColors.texto : AppColors.bg;

    return Container(
      height: 42,
      child: RaisedButton(
        color: background,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
