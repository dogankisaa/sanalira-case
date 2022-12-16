import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void bottomSheet(BuildContext context, Widget sheetBody) {
  showMaterialModalBottomSheet(
      barrierColor: const Color.fromARGB(143, 0, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (context) => sheetBody);
}
