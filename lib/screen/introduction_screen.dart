import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Rule of Thirds',
      body:
          'The "Rule of Thirds" is a photography technique where an image is divided into nine equal parts by two equally spaced horizontal and vertical lines. The subject is placed along these lines or at their intersections, creating a balanced and visually appealing composition. This method helps draw the viewer’s eye naturally to key elements in the photo.',
      image: Center(
        child: Image.asset('assets/images/pic1.jpg'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 16.0),
      ),
    ),
    PageViewModel(
      title: 'Golden Spiral or Fibonacci Spiral',
      body:
          'The "Golden Spiral" or "Fibonacci Spiral" technique in photography involves placing the subject along a spiral shape that mimics the natural growth patterns found in nature. This spiral starts from one corner and expands outward, guiding the viewer’s eye smoothly toward the focal point. It creates a dynamic, balanced composition with a natural sense of movement.',
      image: Center(
        child: Image.asset('assets/images/pic2.jpg'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 16.0),
      ),
    ),
    PageViewModel(
      title: 'Leading Lines',
      body:
          'The "Leading Lines" technique in photography uses lines within the image—such as roads, fences, or pathways—that draw the viewer’s gaze toward the main subject. These lines guide the eye naturally, creating depth and focus, and can make the composition more engaging. It’s especially effective for creating a sense of journey or direction in the image.',
      image: Center(
        child: Image.asset('assets/images/pic3.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 16.0),
      ),
    ),
  ];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'techniques of photographer',
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 24, 
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false, 
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
      child: IntroductionScreen(
        pages: pages,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.black,
          activeSize: Size.square(20),
          activeColor: Colors.red,
        ),
        showDoneButton: true,
        done: const Text(
          'Done',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
          color: Colors.red,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
      ),
    ),
  );
}


  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
