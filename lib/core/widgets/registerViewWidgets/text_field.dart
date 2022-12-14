import 'package:flutter/material.dart';

import '../../consts/register_constants.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  const CustomTextField({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.headline3!.copyWith(
            color: RegisterConstants().textInputInputColor,
            decoration: TextDecoration.none),
        cursorColor: RegisterConstants().textInputCursorColor,
        decoration: InputDecoration(
          contentPadding: RegisterConstants().textFieldContentPadding,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: RegisterConstants().textInputColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: RegisterConstants().textInputColor),
          ),
        ),
      ),
    );
  }
}
