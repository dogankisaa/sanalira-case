import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_case/View/bank_view.dart';
import 'package:sanalira_case/theme/text_theme.dart';
import 'package:sanalira_case/view/register_view.dart';
import 'package:sanalira_case/viewModel/bank_view_model.dart';
import 'package:sanalira_case/viewModel/register_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
      builder: (context, child) => const MyApp(),
    ),
    ChangeNotifierProvider<BankViewModel>(
      create: (context) => BankViewModel(),
      builder: (context, child) => const MyApp(),
    )
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: userCheck(),
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: textTheme(),
          primarySwatch: Colors.blue,
          fontFamily: "Inter"),
    );
  }
}

userCheck() {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    return RegisterView();
  } else {
    return BankView();
  }
}
