import 'package:flutter/material.dart';

class BankConstants {
  Color backgroundColor = const Color.fromRGBO(243, 244, 246, 1);
  Color titleTextColor = const Color.fromRGBO(20, 28, 45, 1);
  Color subTitleTextColor = const Color.fromRGBO(207, 212, 222, 1);
  Color chooseBankTextColor = const Color.fromRGBO(207, 212, 222, 1);
  Color bankLogoBorderColor = const Color.fromRGBO(207, 212, 222, 1);
  Color bankListNameColor = const Color.fromRGBO(20, 28, 45, 1);
  Color bankListSubTitleColor = const Color.fromRGBO(207, 212, 222, 1);
  Color loadingColor = const Color.fromRGBO(102, 204, 120, 1);
  Color notificationColor = const Color.fromRGBO(102, 204, 120, 1);
  Color detailLabelCOlor = const Color.fromRGBO(207, 212, 222, 1);
  Color detailInfoBgColor = const Color.fromRGBO(243, 244, 246, 1);
  Color detailInfoTextColor = const Color.fromRGBO(20, 28, 45, 1);
  Color detailWarningText1Color = const Color.fromRGBO(188, 194, 206, 1);
  Color detailWarningText2Color = const Color.fromRGBO(246, 73, 73, 1);
  Color detailWarningBgColor = const Color.fromRGBO(255, 246, 246, 1);
  EdgeInsets screenPadding =
      const EdgeInsets.only(left: 15, right: 15, top: 36);

  BorderRadius currentMoneyRadius = BorderRadius.circular(10);
  EdgeInsets currentMoneyInsidePadding =
      const EdgeInsets.symmetric(horizontal: 10);
  BorderRadius bankListRadius = BorderRadius.circular(10);
  EdgeInsets bankListInsidePadding = const EdgeInsets.symmetric(horizontal: 10);
  Radius bankListPaddingRadius = const Radius.circular(10);
  EdgeInsets detailPadding = const EdgeInsets.symmetric(horizontal: 15);

  String backIcon = "assets/left_arrow.svg";
  String notificationIcon = "assets/bell.svg";
  String settingsIcon = "assets/settings.svg";
  String turkeyIcon = "assets/country_turkey.png";
  String chooseBankText = "Türk lirası yatırmak için banka seçiniz.";
  String moneyName = "Türk Lirası";
  String moneyShortName = "TL";
  String moneyQuantity = "234";
  String moneyMark = "₺";
  String bankListSubtitle = "Havale / EFT ile para gönderin.";
  String detailNameText = "Hesap Adı";
  String detailIbanText = "IBAN";
  String detailExplanationText = "Açıklama";
  String copyIcon = "assets/copy.png";
  String detailWarning1 =
      "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.";
  String detailWarning2 =
      "Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.";
  String copiedMessage = "Copied to clipboard";

  double currentMoneyHeight = 56;
  double currentMoneyCountryHeight = 29;
  double bankListHeight = 72;
}
