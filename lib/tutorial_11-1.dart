import 'package:flutter/material.dart';
import 'tutorial_11-2.dart';

void main() {
  runApp(const MyApp11_1());
}

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Tutorial11_1(),
    );
  }
}

class Tutorial11_1 extends StatefulWidget {
  const Tutorial11_1({super.key});

  @override
  State<Tutorial11_1> createState() => _Tutorial11_1State();
}

class _Tutorial11_1State extends State<Tutorial11_1> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          Center(child: Text('Home page', style: TextStyle(fontSize: 30))),
          Center(child: Text('Search page', style: TextStyle(fontSize: 30))),
          MyApp11_2(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Email'),
        ],
      ),
    );
  }
}
