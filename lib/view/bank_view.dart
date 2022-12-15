import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/core/consts/bank_constants.dart';
import 'package:sanalira_case/core/consts/general_constants.dart';
import 'package:sanalira_case/core/consts/register_constants.dart';
import 'package:sanalira_case/core/services/get_bank.dart';
import 'package:sanalira_case/viewModel/bank_view_model.dart';
import 'package:sanalira_case/viewModel/register_view_model.dart';

import '../core/widgets/logo_widget.dart';
import '../core/widgets/registerViewWidgets/text_field.dart';
import '../core/widgets/registerViewWidgets/text_field_label.dart';

class BankView extends StatelessWidget {
  const BankView({super.key});

  @override
  Widget build(BuildContext context) {
    late BankViewModel viewModel;
    late BuildContext _context;
    return ChangeNotifierProvider.value(
      value: viewModel = BankViewModel(),
      builder: (context, child) {
        _context = context;
        return Scaffold(
            backgroundColor: BankConstants().backgroundColor,
            body: Padding(
                padding: BankConstants().screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    const SizedBox(
                      height: 21,
                    ),
                    currentQuantityCard(context),
                    const SizedBox(
                      height: 13,
                    ),
                    chooseBankText(context),
                    SizedBox(
                      height: 13,
                    ),
                    bankList()
                  ],
                )));
      },
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appBarIcon(BankConstants().backIcon),
        Row(
          children: [
            Stack(
              children: [
                appBarIcon(BankConstants().notificationIcon),
                Positioned(
                  left: 20,
                  top: 10,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: BankConstants().notificationColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 9,
            ),
            appBarIcon(BankConstants().settingsIcon),
          ],
        )
      ],
    );
  }

  Container currentQuantityCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: BankConstants().currentMoneyHeight,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BankConstants().currentMoneyRadius),
      child: Padding(
        padding: BankConstants().currentMoneyInsidePadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: BankConstants().currentMoneyCountryHeight,
                  height: BankConstants().currentMoneyCountryHeight,
                  child: Image.asset(RegisterConstants().countryTurkey),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BankConstants().moneyName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: BankConstants().titleTextColor),
                    ),
                    Text(
                      BankConstants().moneyShortName,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: BankConstants().subTitleTextColor),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "${BankConstants().moneyQuantity} ${BankConstants().moneyMark}",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: BankConstants().titleTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Text chooseBankText(BuildContext context) {
    return Text(
      BankConstants().chooseBankText,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: BankConstants().chooseBankTextColor),
    );
  }

  Expanded bankList() {
    return Expanded(
      child: FutureBuilder(
        future: GetBanks().getBanks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return bankListCard(
                          context, snapshot.data[index]["bankName"]);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: BankConstants().loadingColor,
              ),
            );
          }
        },
      ),
    );
  }

  Column bankListCard(BuildContext context, bankName) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: BankConstants().bankListHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BankConstants().bankListRadius),
          child: Padding(
            padding: BankConstants().bankListInsidePadding,
            child: Row(
              children: [
                SizedBox(
                  height: 55,
                  width: 80,
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: BankConstants().bankListPaddingRadius,
                      color: BankConstants().bankLogoBorderColor,
                      strokeWidth: 1,
                      child: Center(
                          child: Text(
                        "Logo",
                        style: Theme.of(context).textTheme.headline2,
                      ))),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bankName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: BankConstants().bankListNameColor),
                    ),
                    Text(
                      BankConstants().bankListSubtitle,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: BankConstants().bankListSubTitleColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }

  Container appBarIcon(icon) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
