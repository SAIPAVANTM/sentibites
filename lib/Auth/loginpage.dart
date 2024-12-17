import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sentibites/Auth/User_Loginpage.dart';
import 'package:sentibites/Auth/signuppage.dart';
import 'package:sentibites/Auth/forgotpswdpage.dart';

import '../HomePage/home.dart';
import '../Urls.dart';

class userlogin extends StatefulWidget {
  const userlogin({super.key});

  @override
  State<userlogin> createState() => _userloginState();
}

class _userloginState extends State<userlogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // The login method with email sending after successful login
  Future<void> loginUser() async {
    final String statusUrl = "${Url.Urls}/get/admin/users/status";
    final String loginUrl = "${Url.Urls}/login";
    final String addEmailUrl = "${Url.Urls}/add_email"; // The new route for adding the email

    try {
      // Step 1: Fetch user statuses
      final statusResponse = await http.get(
        Uri.parse(statusUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (statusResponse.statusCode == 200) {
        final statusData = jsonDecode(statusResponse.body);

        // Step 2: Find the user's status from the list
        final userStatus = (statusData['users_status'] as List).firstWhere(
              (user) => user['email'] == emailController.text,
          orElse: () => null,
        );

        if (userStatus != null && (userStatus['status'] as String).toLowerCase() == 'active') {
          // Step 3: Proceed with login if the status is "active"
          final loginResponse = await http.post(
            Uri.parse(loginUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "email": emailController.text,
              "password": passwordController.text,
            }),
          );

          if (loginResponse.statusCode == 200) {
            // Successful login, send email to /add_email route
            await http.post(
              Uri.parse(addEmailUrl),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "email": emailController.text, // Send email only
              }),
            );

            // Navigate to HomePage after successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            // Handle login errors
            final loginError = jsonDecode(loginResponse.body);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(loginError['message'] ?? 'Login failed')),
            );
          }
        } else {
          // User status is not "active"
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Your account is not active. Please contact support.')),
          );
        }
      } else {
        // Handle errors in fetching the user statuses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to verify account status. Please try again later.')),
        );
      }
    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top yellow background with back button
          Container(
            height: MediaQuery.of(context).size.height * 0.20, // Adjust top height
            color: Colors.blueGrey[900], // Yellow color for the top section
            child: Stack(
              children: [
                // Back button at the top left corner
                Positioned(
                  left: 5,
                  top: 65,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => signuppage())); // Go back to the previous screen
                    },
                  ),
                ),
                // Log In text in the center
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25), // Adjust this value to move the text down
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 24, // H2 size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // White background container with curved top edges
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.79, // Remaining part
              decoration: BoxDecoration(
                color: Colors.white, // White background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), // Curved top-left corner
                  topRight: Radius.circular(50), // Curved top-right corner
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome and additional text
                    SizedBox(height: 0), // Space to align with the top background
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 28, // H2 size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Log in to explore, review, and understand the sentiments behind every dish you try.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 50), // Space between text and fields

                    // Email/Phone label outside the input field
                    Text(
                      'Email or Mobile Number',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // Email/Phone input field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16), // Space between input fields

                    // Password label outside the input field
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // Password input field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16), // Space between input fields

                    // Forgot Password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Centered Login button outside the email/password fields
                    Center(
                      child: ElevatedButton(
                        onPressed: loginUser,
                        child: Center(child: Text('Login')),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Button color
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10), // Reduced padding
                          minimumSize: Size(100, 40), // Set width and height for the button
                          textStyle: TextStyle(fontSize: 16), // Adjusted font size if necessary
                        ),
                      ),
                    ),
                    SizedBox(height: 14),

                    // Sign up link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the signup page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signup()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
