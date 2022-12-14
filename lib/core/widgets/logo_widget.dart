import 'package:flutter/material.dart';

import '../consts/general_constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60, width: 60, child: Image.asset(GeneralConstants().logo));
  }
}
