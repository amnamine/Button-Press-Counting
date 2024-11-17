import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _buttonColor = Colors.deepPurple; // Initial color of the button
  Color _counterColor = Colors.black; // Initial color of the counter
  Color _textColor = Colors.black; // Initial color of the text
  Color _labelTextColor = Colors.black; // Color for the label text

  // Function to change colors randomly
  void _changeColors() {
    setState(() {
      _buttonColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      _counterColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      _textColor = Color((Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0); // Random color for text
      _labelTextColor = Color((Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0); // Random color for label text
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _changeColors(); // Change colors on each press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Press Counting"), // AppBar title
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align the column to start
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center everything horizontally
          children: <Widget>[
            // "PRESS THE BUTTON" text positioned a bit higher and increased font size
            Padding(
              padding: const EdgeInsets.only(top: 40.0), // Added top padding
              child: Text(
                'PRESS THE BUTTON',
                style: TextStyle(
                  fontSize: 48, // Increased font size for the text
                  fontWeight: FontWeight.bold,
                  color: _textColor, // Text color changes randomly
                ),
              ),
            ),
            const SizedBox(height: 30), // Add space between text and label
            // Description text above the counter with slightly bigger font size
            Text(
              'The number of times you have pressed the button is:',
              style: TextStyle(
                fontSize: 22, // Increased font size for description text
                fontWeight: FontWeight.w500,
                color: _labelTextColor, // Label text color changes randomly
              ),
            ),
            const SizedBox(height: 20), // Space between label and counter
            // The counter with larger font size
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 120, // Larger font size for the counter
                fontWeight: FontWeight.bold,
                color: _counterColor, // Counter color changes randomly
              ),
            ),
            const Spacer(), // Push the floating action button to the bottom
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment:
            Alignment.bottomCenter, // Align the button at the bottom center
        child: SizedBox(
          width: 160, // Larger width for the button
          height: 160, // Larger height for the button
          child: FloatingActionButton(
            backgroundColor: _buttonColor, // Button color changes randomly
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(
              Icons.add,
              size: 90, // Increased icon size
            ),
          ),
        ),
      ),
    );
  }
}
