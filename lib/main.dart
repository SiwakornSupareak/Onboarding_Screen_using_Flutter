import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemChrome
import 'package:onboarding/screens/onboarding_screen.dart';
import 'package:onboarding/screens/welcome.dart';

void main() {
  // Set the app to fullscreen mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); // Add const constructor

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/welcome': (context) => WelcomePage(),
      },
    );
  }
}
