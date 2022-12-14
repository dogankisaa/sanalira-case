import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/core/consts/general_constants.dart';
import 'package:sanalira_case/core/consts/register_constants.dart';
import 'package:sanalira_case/viewModel/register_view_model.dart';

import '../core/widgets/logo_widget.dart';
import '../core/widgets/registerViewWidgets/text_field.dart';
import '../core/widgets/registerViewWidgets/text_field_label.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    late RegisterViewModel viewModel;
    late BuildContext _context;
    return ChangeNotifierProvider.value(
      value: viewModel = RegisterViewModel(),
      builder: (context, child) {
        _context = context;
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: backgroundImage(),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Spacer(),
                    labelLogo(context),
                    const Spacer(),
                    registerBottomSheet(context, viewModel)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container registerBottomSheet(
      BuildContext context, RegisterViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          color: RegisterConstants().bottomSheetBackGroundColor,
          borderRadius: RegisterConstants().bottomSheetRadius),
      width: double.infinity,
      child: Padding(
        padding: RegisterConstants().bottomSheetPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeText(context),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: viewModel.registerFormKey,
              child: Column(
                children: [
                  textFieldAndLabel(RegisterConstants().textFieldLabelName,
                      viewModel.nameController, viewModel.nameValidator()),
                  textFieldAndLabel(
                      RegisterConstants().textFieldLabelSurName,
                      viewModel.surnameController,
                      viewModel.surnameValidator()),
                  textFieldAndLabel(RegisterConstants().textFieldLabelMail,
                      viewModel.mailController, viewModel.mailValidator()),
                  textFieldAndLabel(
                      RegisterConstants().textFielLabelPassword,
                      viewModel.passwordController,
                      viewModel.passwordValidator()),
                  textFieldPhoneNumber(
                      context, viewModel, viewModel.numberValidator()),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            checkBoxRow(viewModel, context),
            const SizedBox(
              height: 15,
            ),
            loginButton(viewModel, context)
          ],
        ),
      ),
    );
  }

  SizedBox loginButton(RegisterViewModel viewModel, BuildContext context) {
    return SizedBox(
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          viewModel.login(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: RegisterConstants().loginButtonRadius),
            primary: RegisterConstants().loginButtonBackGround),
        child: Center(
          child: Text(RegisterConstants().loginButtonText),
        ),
      ),
    );
  }

  Column welcomeText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: RegisterConstants().logoText,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: GeneralConstants().appColor)),
              TextSpan(
                  text: RegisterConstants().newRegisterText,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: RegisterConstants().whiteColor)),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          RegisterConstants().infoAndAgreementText,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: RegisterConstants().infoAndAgreementTextColor),
        ),
      ],
    );
  }

  Row checkBoxRow(RegisterViewModel viewModel, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Consumer<RegisterViewModel>(
            builder: (context, value, child) => SizedBox(
              height: 20.0,
              width: 20.0,
              child: Theme(
                data: ThemeData(
                    unselectedWidgetColor:
                        RegisterConstants().checkBoxOutlineColor),
                child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: RegisterConstants().checkBoxRadius,
                    ),
                    activeColor: RegisterConstants().checkBoxColor,
                    value: viewModel.isAgreementCheck,
                    onChanged: (value) {
                      viewModel.agreementCheck();
                    }),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: RegisterConstants().whenCreatingAccText,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: RegisterConstants().whiteColor)),
                TextSpan(
                    text: RegisterConstants().agreementAndTermsText,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: GeneralConstants().appColor)),
                TextSpan(
                    text: RegisterConstants().youMustAccept,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: RegisterConstants().whiteColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column textFieldPhoneNumber(
      BuildContext context, RegisterViewModel viewModel, validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(
          text: RegisterConstants().textFieldLabelNumber,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 10,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: RegisterConstants().textInputInputColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset(RegisterConstants().countryTurkey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      RegisterConstants().countryCode,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: RegisterConstants().countryCodeColor),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 8,
              child: CustomTextField(
                controller: viewModel.phoneController,
                validator: validator,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Consumer textFieldAndLabel(label, controller, validator) {
    return Consumer<RegisterViewModel>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(
            text: label,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            controller: controller,
            validator: validator,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row labelLogo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Logo(),
        const SizedBox(
          width: 11,
        ),
        Text(
          GeneralConstants().logoText,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  DecorationImage backgroundImage() {
    return DecorationImage(
      image: AssetImage(RegisterConstants().backgroundPath),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
          const Color.fromRGBO(20, 28, 45, 1).withOpacity(0.8),
          BlendMode.srcOver),
    );
  }
}
