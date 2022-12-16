import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void bottomSheet(BuildContext context, Widget sheetBody) {
  showMaterialModalBottomSheet(
      barrierColor: Color.fromARGB(143, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (context) => sheetBody);
}
