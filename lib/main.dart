import 'package:Diligent/config/palette.dart';
import 'package:Diligent/presenters/presenters/presenters.dart';
import 'package:Diligent/utils/user_defaults.dart';
import 'package:flutter/material.dart';

import 'views/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDefaults.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.scaffold),
      home: HomeScreen(
        presenter: HomePresenter(),
      ),
    );
  }
}
