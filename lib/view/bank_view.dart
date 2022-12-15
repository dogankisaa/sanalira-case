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
            appBar: AppBar(
              leading: SvgPicture.asset(BankConstants().backIcon,
                  semanticsLabel: 'Acme Logo'),
              elevation: 0.0,
              backgroundColor: BankConstants().backgroundColor,
            ),
            body: Container());
      },
    );
  }
}
