import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../HomePage/home.dart';
import '../Urls.dart';
import '../items/itemspage.dart';
import 'analysisprawn.dart';
import 'chart1.dart';

class MexicanAppetizerPage extends StatefulWidget {
  const MexicanAppetizerPage({super.key});

  @override
  _MexicanAppetizerPageState createState() => _MexicanAppetizerPageState();
}

class _MexicanAppetizerPageState extends State<MexicanAppetizerPage> {
  List<String> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final response = await http.get(Uri.parse('${Url.Urls}/fetch_user_mexican'));

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
      body: Stack(
        children: [
          // Top yellow background with text and back button
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
          DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Text(
                        'Mexican Appetizer',
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
                        'assets/f1.png', // Replace with your image asset
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
                    // Scrollable rectangle with reviews inside
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DraggableScrollableSheet(
                        initialChildSize: 0.3,
                        minChildSize: 0.2,
                        maxChildSize: 0.7,
                        builder: (BuildContext context, scrollController) {
                          return ListView.builder(
                            controller: scrollController,
                            itemCount: reviews.length, // Total reviews dynamically loaded
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('Review ${index + 1}'),
                                subtitle: Text(reviews[index]),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    // Button to "See Chart"
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to charttt1 page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => charttt1()),
                        );
                      },
                      child: Text('See Chart'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                    MaterialPageRoute(builder: (context) => MexicanAppetizerPage()),
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
