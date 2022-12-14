import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/viewModel/register_view_model.dart';

import '../../consts/register_constants.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final validator;
  const CustomTextField({
    Key? key,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 44,
        child: Consumer<RegisterViewModel>(
          builder: (context, value, child) => TextFormField(
            controller: controller,
            validator: validator,

            //),
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: RegisterConstants().textInputInputColor,
                ),
            cursorColor: RegisterConstants().textInputCursorColor,
            decoration: InputDecoration(
              contentPadding: RegisterConstants().textFieldContentPadding,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: RegisterConstants().textInputColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: RegisterConstants().textInputColor),
              ),
            ),
          ),
        ));
  }
}
