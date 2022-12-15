import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanalira_case/core/services/get_bank.dart';
import 'package:sanalira_case/core/services/register.dart';
import 'package:sanalira_case/viewModel/base_view_model.dart';

import '../core/route/route.gr.dart';

class BankViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    GetBanks().getBanks();
  }
}
