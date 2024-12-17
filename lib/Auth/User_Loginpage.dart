import 'package:flutter/material.dart';
import 'package:sentibites/Admin/adminlogin.dart';
import 'package:sentibites/Auth/loginpage.dart';
import 'package:sentibites/Owner/ownerlogin.dart';

class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cro.png', // Replace with your image path
              height: 200, // Adjust size as needed
            ),
            SizedBox(height: 0), // Space between image and text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      fontSize: 32, // Adjust text size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[3500]
                      , // "SENTI" in yellow
                    ),
                  ),
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      fontSize: 32, // Adjust text size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // "BITES" in white
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100), // Space between text and buttons
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to user login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => userlogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text('User Log In'),

              ),
            ),
            SizedBox(height: 30), // Space between buttons
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OwnerLogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text('Owner Log In'),
              ),
            ),
            SizedBox(height: 30), // Space between buttons
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLogin()), // Replace with the correct class
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text('Admin Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
