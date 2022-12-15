import 'package:auto_route/auto_route.dart';
import 'package:sanalira_case/view/bank_view.dart';
import 'package:sanalira_case/view/register_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: RegisterView),
    AutoRoute(page: BankView, initial: true),
  ],
)
class $AppRouter {}
