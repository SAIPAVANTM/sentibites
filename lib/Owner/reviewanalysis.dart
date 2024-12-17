import 'package:flutter/material.dart';
import 'package:sentibites/Owner/ownerburger.dart';
import 'package:sentibites/analysis/burgeranalysis.dart';
import 'package:sentibites/analysis/pizzaanalysis.dart';
import 'package:sentibites/analysis/pongalanalysis.dart';
import 'package:sentibites/analysis/samosaanalysis.dart';
import 'package:sentibites/analysis/vadaanalysis.dart';
import '../HomePage/home.dart';
import '../analysis/dosaanalysis.dart';
import '../items/itemspage.dart';
import 'ownerdosa.dart';
import 'ownerpizza.dart';
import 'ownerpongal.dart';
import 'ownersamosa.dart';
import 'ownervada.dart';


class reviewanaly extends StatelessWidget {
  const reviewanaly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top blue background with text and back button
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
          // Main content with analysis details
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Select Dish',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Row of two images with text below
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Burger Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ownerbu()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/burger.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Burger'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Pizza Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ownerpi()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/pizza.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Pizza'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Row of two more images with text below
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Samosa Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ownersam()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/samosa.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Samosa'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Pongal Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ownerpo()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/pongal.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Pongal'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Row of two additional images with text below
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Dosa Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ownerdo()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/dosa.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Dosa'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Vada Analysis Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ownerva()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/vada.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Vada'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
