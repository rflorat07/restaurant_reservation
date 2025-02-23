import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'presentation/welcome/screens/welcome.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
