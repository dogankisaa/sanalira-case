import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/theme/text_theme.dart';
import 'package:sanalira_case/viewModel/bank_view_model.dart';
import 'package:sanalira_case/viewModel/register_view_model.dart';

import 'core/route/route.gr.dart';
import 'view/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
      builder: (context, child) => MyApp(),
    ),
    ChangeNotifierProvider<BankViewModel>(
      create: (context) => BankViewModel(),
      builder: (context, child) => MyApp(),
    )
  ]));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: textTheme(),
          primarySwatch: Colors.blue,
          fontFamily: "Inter"),
    );
  }
}
