import 'package:flutter/material.dart';
import 'introduction_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('photographer'),
        centerTitle: true,
        automaticallyImplyLeading: false, 
      ),
      backgroundColor: Colors.black, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Photography techniques',
              style: TextStyle(fontSize: 23, color: Colors.white), 
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreen()),
                );
              },
              child: const Text(
                'Introduction',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
