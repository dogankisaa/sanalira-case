import 'package:flutter/material.dart';

import '../../consts/register_constants.dart';

class TextFieldLabel extends StatelessWidget {
  final text;

  const TextFieldLabel({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: RegisterConstants().textInputLabelColor),
    );
  }
}
