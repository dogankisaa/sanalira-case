import 'package:flutter/material.dart';

class RegisterConstants {
  String backgroundPath = "assets/register_background.png";
  String countryTurkey = "assets/country_turkey.png";
  String newRegisterText = " Yeni Üyelik";
  String logoText = "SanaLira'ya";
  String infoAndAgreementText = "Bilgilerinizi girip sözleşmeyi onaylayın.";
  String textFieldLabelName = "Ad";
  String textFieldLabelSurName = "Soyad";
  String textFieldLabelMail = "E-posta";
  String textFieldLabelNumber = "Cep Telefonu Numaranız";
  String countryCode = "+90";
  String whenCreatingAccText = "Hesabınızı oluştururken";
  String agreementAndTermsText = " sözleşme ve koşulları";
  String youMustAccept = " kabul etmeniz gerekir.";
  String loginButtonText = "Giriş Yap";

  BorderRadius bottomSheetRadius = const BorderRadius.only(
      topLeft: Radius.circular(30), topRight: Radius.circular(30));
  EdgeInsets bottomSheetPadding =
      const EdgeInsets.symmetric(horizontal: 15, vertical: 31);
  EdgeInsets textFieldContentPadding = const EdgeInsets.all(10);
  BorderRadius checkBoxRadius = BorderRadius.circular(6);
  BorderRadius loginButtonRadius = BorderRadius.circular(10);

  Color bottomSheetBackGroundColor = const Color.fromRGBO(37, 45, 61, 0.7);
  Color whiteColor = Colors.white;
  Color infoAndAgreementTextColor = const Color.fromRGBO(207, 212, 222, 1);
  Color textInputColor = const Color.fromRGBO(207, 212, 222, 1);
  Color textInputCursorColor = const Color.fromRGBO(207, 212, 222, 1);
  Color textInputLabelColor = const Color.fromRGBO(207, 212, 222, 1);
  Color textInputInputColor = const Color.fromRGBO(207, 212, 222, 1);
  Color countryCodeColor = const Color.fromRGBO(207, 212, 222, 1);
  Color checkBoxOutlineColor = const Color.fromRGBO(207, 212, 222, 1);
  Color checkBoxColor = const Color.fromRGBO(102, 204, 120, 1);
  Color loginButtonBackGround = const Color.fromRGBO(102, 204, 120, 1);
}
