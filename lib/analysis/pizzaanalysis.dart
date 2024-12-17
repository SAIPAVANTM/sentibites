import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sentibites/analysis/pizzachart.dart';
import 'dart:convert';
import '../HomePage/home.dart';
import '../Urls.dart';
import '../items/itemspage.dart';

class PizzaPage extends StatefulWidget {
  const PizzaPage({super.key});

  @override
  _PizzaPageState createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  List<String> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final response = await http.get(Uri.parse('${Url.Urls}/fetch_pizza_reviews'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        reviews = List<String>.from(data['reviews'].map((review) => review['review']));
      });
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top background with text and back button
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            color: Colors.red[800],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Pizza Analysis',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Image section
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/pizza.jpg', // Replace with your image asset
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                // Centered Subheading for reviews
                Center(
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Scrollable rectangle with reviews inside (non-draggable)
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Review ${index + 1}'),
                        subtitle: Text(reviews[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                // Button to "See Chart" centered
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to chartpizza page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pizzaChart()),
                      );
                    },
                    child: Text(
                      'See Chart',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
