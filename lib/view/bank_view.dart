import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/core/consts/bank_constants.dart';

import 'package:sanalira_case/core/consts/register_constants.dart';
import 'package:sanalira_case/core/services/get_bank.dart';
import 'package:sanalira_case/viewModel/bank_view_model.dart';

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
                    header(context),
                    const SizedBox(
                      height: 21,
                    ),
                    currentQuantityCard(context),
                    const SizedBox(
                      height: 13,
                    ),
                    chooseBankText(context),
                    const SizedBox(
                      height: 13,
                    ),
                    bankList()
                  ],
                )));
      },
    );
  }

  Row header(BuildContext context) {
    final viewModel = Provider.of<BankViewModel>(context, listen: false);
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
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  viewModel.logOut(context);
                },
                child: appBarIcon(BankConstants().settingsIcon)),
          ],
        )
      ],
    );
  }

  Container appBarIcon(icon) {
    return Container(
      height: BankConstants().appBarIconDimensions,
      width: BankConstants().appBarIconDimensions,
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
                          context,
                          snapshot.data[index]["bankName"],
                          snapshot.data[index]["bankAccountName"],
                          snapshot.data[index]["bankIban"],
                          snapshot.data[index]["descriptionNo"]);
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

  Consumer bankListCard(
      BuildContext context, bankName, name, iban, description) {
    return Consumer<BankViewModel>(
      builder: (context, value, child) => InkWell(
        onTap: () => value.bankDetail(
            context, bottomSheetBody(context, name, iban, description)),
        child: Column(
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
                      height: BankConstants().bankListHeight,
                      width: BankConstants().bankListLogoWith,
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
                              .copyWith(
                                  color: BankConstants().bankListNameColor),
                        ),
                        Text(
                          BankConstants().bankListSubtitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  color: BankConstants().bankListSubTitleColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  Padding bottomSheetBody(BuildContext context, name, iban, description) {
    return Padding(
      padding: BankConstants().detailPadding,
      child: Container(
        height: BankConstants().detailBottomSheetHeigth,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 30,
            ),
            detailInfo(context, BankConstants().detailNameText, name),
            detailInfo(context, BankConstants().detailIbanText, iban),
            detailInfo(
                context, BankConstants().detailExplanationText, description),
            warning1(context),
            const SizedBox(
              height: 9,
            ),
            warning2(context)
          ],
        ),
      ),
    );
  }

  Container warning2(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BankConstants().detailWarningBgColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            textAlign: TextAlign.center,
            BankConstants().detailWarning2,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: BankConstants().detailWarningText2Color),
          ),
        ),
      ),
    );
  }

  Container warning1(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BankConstants().detailInfoBgColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            textAlign: TextAlign.center,
            BankConstants().detailWarning1,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: BankConstants().detailWarningText1Color),
          ),
        ),
      ),
    );
  }

  Column detailInfo(BuildContext context, label, info) {
    final viewModel = Provider.of<BankViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: BankConstants().detailLabelCOlor),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BankConstants().detailInfoBgColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    info,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: BankConstants().detailInfoTextColor),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: info));
                    viewModel.copyInfo(context, BankConstants().copiedMessage);
                  },
                  child: SizedBox(
                      height: 13,
                      width: 13,
                      child: Image.asset(BankConstants().copyIcon)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
