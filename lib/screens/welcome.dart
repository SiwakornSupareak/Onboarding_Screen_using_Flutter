import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Black background
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.white), // White text
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back icon
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/onboarding'); // Navigate to OnboardingScreen
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to our App!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}