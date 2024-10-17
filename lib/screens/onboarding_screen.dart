import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const OnboardingPage(
      title: 'Welcome to Our App',
      description: 'Discover amazing features and benefits.',
      image: 'assets/images/welcome.png',
    ),
    const OnboardingPage(
      title: 'Stay Organized',
      description: 'Keep all your tasks in one place.',
      image: 'assets/images/organize.jpg',
    ),
    const OnboardingPage(
      title: 'Get Started Now',
      description: 'Join us and enhance your productivity.',
      image: 'assets/images/start.jpg',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/welcome');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _skipToWelcome() {
    Navigator.of(context).pushReplacementNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Onboarding',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: _skipToWelcome,
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomSheet: Container(
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPage > 0)
              TextButton(
                onPressed: _previousPage,
                child: const Text('Back'),
              ),
            if (_currentPage > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
            TextButton(
              onPressed: _nextPage,
              child: Text(_currentPage == _pages.length - 1 ? 'Done' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 370,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
