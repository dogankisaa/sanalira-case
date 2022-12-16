import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanalira_case/core/helper/bottom_sheet.dart';
import 'package:sanalira_case/core/helper/snacbar.dart';
import 'package:sanalira_case/core/services/get_bank.dart';
import 'package:sanalira_case/view/register_view.dart';

import 'package:sanalira_case/viewModel/base_view_model.dart';

class BankViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    GetBanks().getBanks();
  }

  bankDetail(BuildContext context, body) {
    bottomSheet(context, body);
  }

  copyInfo(BuildContext context, message) {
    snackBar(context, message);
    Navigator.pop(context);
    notifyListeners();
  }

  logOut(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterView()),
    );
  }
}
