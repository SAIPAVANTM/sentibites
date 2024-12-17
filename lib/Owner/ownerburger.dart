import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Urls.dart';
import '../analysis/burgerchart.dart';



class ownerbu extends StatefulWidget {
  const ownerbu({super.key});

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<ownerbu> {
  List<String> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final response = await http.get(Uri.parse('${Url.Urls}/fetch_burger_reviews'));

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
            color: Colors.brown[800],
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

          // Main content directly below the header
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Burger Analysis',
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
                        'assets/burger.jpg', // Replace with your image asset
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Subheading for reviews
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
                    // Button to "See Chart"
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to chartburger page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => burgerchart()),
                        );
                      },
                      child: Text(
                        'See Chart',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
