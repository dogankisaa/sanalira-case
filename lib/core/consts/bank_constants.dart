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

  EdgeInsets screenPadding =
      const EdgeInsets.only(left: 15, right: 15, top: 36);

  BorderRadius currentMoneyRadius = BorderRadius.circular(10);
  EdgeInsets currentMoneyInsidePadding =
      const EdgeInsets.symmetric(horizontal: 10);
  BorderRadius bankListRadius = BorderRadius.circular(10);
  EdgeInsets bankListInsidePadding = const EdgeInsets.symmetric(horizontal: 10);
  Radius bankListPaddingRadius = const Radius.circular(10);

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

  double currentMoneyHeight = 56;
  double currentMoneyCountryHeight = 29;
  double bankListHeight = 72;
}
