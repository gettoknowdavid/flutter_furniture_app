import 'package:flutter/material.dart';
import 'screen_controller.dart';
import 'theme.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenController(),
      title: 'Lamda',
      theme: LamdaTheme.theme,
    );
  }
}
