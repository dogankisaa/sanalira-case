import 'package:flutter/cupertino.dart';
import 'package:sanalira_case/viewModel/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isAgreementCheck = false;
  @override
  Future<void> init() async {}

  agreementCheck() {
    isAgreementCheck = !isAgreementCheck;

    notifyListeners();
  }
}
