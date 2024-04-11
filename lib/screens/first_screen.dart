import 'package:flutter/material.dart';
import 'package:test_2/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(68, 189, 84, 0.6), Color.fromRGBO(29, 179, 164, 1)]),

          border: Border.all(
            color: Colors.red,
          ),

        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text('Test',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text('Home'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 50,
                      color: Colors.green,
                    ),
                    Text('Search'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  labelText: 'Email',
                ))),

            const SizedBox(height: 20),



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade50, // Background color
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Go To Second Screen'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
