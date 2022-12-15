import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanalira_case/core/services/register.dart';
import 'package:sanalira_case/viewModel/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String numberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$';

  final registerFormKey = GlobalKey<FormState>();
  bool isAgreementCheck = false;
  @override
  Future<void> init() async {}

  agreementCheck() {
    isAgreementCheck = !isAgreementCheck;

    notifyListeners();
  }

  nameValidator() {
    return (value) {
      print(value);
      if (value.isEmpty) {
        return "Lütfen adınızı giriniz.";
      } else if (value.length < 3) {
        return "Adınız minimum 3, maksimum 50 karakter olmalıdır";
      }
    };
  }

  surnameValidator() {
    return (value) {
      print(value);
      if (value.isEmpty) {
        return "Lütfen soyadınızı giriniz.";
      } else if (value.length < 3 || value.length > 50) {
        return "Soyadınız minimum 3, maksimum 50 karakter olmalıdır";
      }
    };
  }

  mailValidator() {
    return (value) {
      print(value);
      if (value.isEmpty) {
        return "Lütfen mail adresinizi giriniz.";
      } else if (!EmailValidator.validate(mailController.text)) {
        return "Lütfen geçerli bir mail adresi giriniz.";
      }
    };
  }

  numberValidator() {
    return (value) {
      print(value);
      if (value.isEmpty) {
        return "Lütfen numaranızı giriniz.";
      } else if (!RegExp(numberPattern).hasMatch(phoneController.text)) {
        return "Lütfen geçerli bir telefon nuamrası giriniz.";
      }
    };
  }

  passwordValidator() {
    return (value) {
      print(value);
      if (value.isEmpty) {
        return "Lütfen bir şifre giriniz.";
      } else if (value.length < 6 || value.length > 20) {
        return "Şifreniz en az 6, en fazla 20 karakter olmalıdır.";
      } else if (!RegExp(passwordPattern).hasMatch(passwordController.text)) {
        return "Lütfen geçerli bir şifre giriniz.";
      }
    };
  }

  login() {
    if (registerFormKey.currentState!.validate()) {
      RegisterService().register(mailController.text, passwordController.text);
    }

    notifyListeners();
  }
}
