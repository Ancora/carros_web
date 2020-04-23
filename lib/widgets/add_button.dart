import 'package:carrosweb/colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;

  AddButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(
          Icons.add,
          color: AppColors.texto,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
