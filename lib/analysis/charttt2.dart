import 'package:flutter/material.dart';

import '../HomePage/home.dart';
import '../items/itemspage.dart';
import 'analysispage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: charttt2(),
    );
  }
}

class charttt2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Added this to handle overflow
        child: Stack(
          children: [
            // Top yellow background with text
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Analysis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
            ),

            // Main content with white background, image, and bar chart
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  // Space to move the image further down
                  SizedBox(height: 50),

                  // Text above the image
                  Text(
                    'Fresh Prawn Ceviche',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Image section
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/f3.png',  // Replace with your image path
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0),

                  // Bar Chart Section
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Bar chart with random percentages
                        Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sentiment Bar Chart',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 20,
                                color: Colors.green[300],
                                width: (150 + (50 * (0.5)) ).toDouble(),  // Positive
                                child: Center(child: Text('Positive 50%')),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 20,
                                color: Colors.red[300],
                                width: (100 + (50 * (0.4)) ).toDouble(),  // Negative
                                child: Center(child: Text('Negative 40%')),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 20,
                                color: Colors.blue[300],
                                width: (120 + (40 * (0.6)) ).toDouble(),  // Neutral
                                child: Center(child: Text('Neutral 60%')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0), // Adjusted bottom padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              SizedBox(width: 60),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items()),
                  );
                },
              ),
              SizedBox(width: 60),
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => analy1()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
