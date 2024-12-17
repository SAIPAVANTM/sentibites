import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';  // To convert response to JSON
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'HomePage/home.dart';
import 'Urls.dart';
import 'analysis/analysispage.dart';
import 'items/itemspage.dart';  // For formatting the price

class finorder extends StatefulWidget {
  const finorder({super.key});

  @override
  _FinOrderState createState() => _FinOrderState();
}

class _FinOrderState extends State<finorder> {
  double totalPrice = 0.0;
  bool isLoading = true;
  String orderNumber = (Random().nextInt(90000) + 10000).toString();
  String date = DateTime.now().toLocal().toString().split(' ')[0]; // Date in yyyy-MM-dd format
  String time = DateTime.now().toLocal().toString().split(' ')[1].split('.')[0]; // Time in HH:mm:ss format

  @override
  void initState() {
    super.initState();
    fetchTotalPrice();
    sendOrderToBackend(orderNumber);
  }

  // Function to fetch the total price from the backend
  Future<void> fetchTotalPrice() async {
    final url = Uri.parse('${Url.Urls}/cart/total_price/fetch'); // Replace with your Flask server URL
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          totalPrice = data['price'] != null ? double.parse(data['price'].toString()) : 0.0;
          isLoading = false;
        });
      } else {
        print('Failed to fetch price: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to send the order_no to the backend
  Future<void> sendOrderToBackend(String orderNumber) async {
    final url = Uri.parse('${Url.Urls}/add_order'); // Replace with your Flask server URL
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'order_no': orderNumber});

    try {
      final response = await http.post(url, headers: headers, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');  // Log the response body

      if (response.statusCode == 201) {
        print('Order added successfully');
      } else {
        print('Failed to add order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    // Format the price
    String formattedPrice = NumberFormat.currency(symbol: '₹').format(totalPrice);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            color: Colors.blueGrey[900],
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Details',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Order No: $orderNumber'),
                        SizedBox(height: 5),
                        Text('Date: $date'),
                        SizedBox(height: 5),
                        Text('Time: $time'),
                        SizedBox(height: 20),
                        // Removed the Image.asset widget here
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', style: TextStyle(fontSize: 16)),
                              isLoading
                                  ? CircularProgressIndicator()
                                  : Text(formattedPrice, style: TextStyle(fontSize: 16, color: Colors.red[400])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tax', style: TextStyle(fontSize: 16)),
                              Text('\₹0.00', style: TextStyle(fontSize: 16, color: Colors.red[400])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fees', style: TextStyle(fontSize: 16)),
                              Text('\₹0.00', style: TextStyle(fontSize: 16, color: Colors.red[400])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery', style: TextStyle(fontSize: 16)),
                              Text('\₹0.00', style: TextStyle(fontSize: 16, color: Colors.red[400])),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                formattedPrice,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red[400]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
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
