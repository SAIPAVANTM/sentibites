import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sentibites/Onboarding/onboardpage1.dart';
import 'package:http/http.dart' as http;
import '../HomePage/home.dart';
import '../Urls.dart';
import 'loginpage.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  Future<void> signUpUser() async {
    final signupUrl = Uri.parse('${Url.Urls}/signup');
    final adminUrl = Uri.parse('${Url.Urls}/admin/users_post');

    // Payload for both routes
    final Map<String, String> signupData = {
      'name': fullNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'mobilenumber': mobileController.text,
      'dob': dobController.text,
    };

    try {
      // Call the first route (/signup)
      final signupResponse = await http.post(
        signupUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(signupData),
      );

      print("Response from /signup: ${signupResponse.statusCode}");
      print("Body from /signup: ${signupResponse.body}");

      // Call the second route (/admin/users_post) regardless of /signup's result
      final adminResponse = await http.post(
        adminUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': fullNameController.text,
          'email': emailController.text,
          'contact': mobileController.text,
          'dob': dobController.text,
        }),
      );

      print("Response from /admin/users_post: ${adminResponse.statusCode}");
      print("Body from /admin/users_post: ${adminResponse.body}");

      // Navigate to the home screen directly after both routes are completed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Navigate to home screen
      );
    } catch (error) {
      print("Error in signup process: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up. Please try again later.')),
      );
    }
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top yellow background
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
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
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 70,  // Increased the top value to move the text down
                  child: Text(
                    'New Account',
                    style: TextStyle(
                      fontSize: 24, // H2 size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0), // Reduced top padding
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: fullNameController,
                      style: TextStyle(color: Colors.white),  // Set text color to white
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Brighter yellow color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Curved corners
                          borderSide: BorderSide.none, // Remove the border outline
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Email
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),  // Set text color to white
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Brighter yellow color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Curved corners
                          borderSide: BorderSide.none, // Remove the border outline
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Mobile Number
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: mobileController,
                      style: TextStyle(color: Colors.white),  // Set text color to white
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Brighter yellow color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Curved corners
                          borderSide: BorderSide.none, // Remove the border outline
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Password
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),  // Set text color to white
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Brighter yellow color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Curved corners
                          borderSide: BorderSide.none, // Remove the border outline
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Date of Birth
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: dobController,
                      style: TextStyle(color: Colors.white),  // Set text color to white
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Brighter yellow color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Curved corners
                          borderSide: BorderSide.none, // Remove the border outline
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent), // Transparent border
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Agreement Text with different colors for Terms and Privacy Policy
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'By continuing, you agree to ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service tapped');
                                },
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy tapped');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Sign Up Button
                    Center(
                      child: ElevatedButton(
                        onPressed: signUpUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Login redirection text
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => userlogin()),
                          );
                        },
                        child: Text(
                          'Already have an account? Login here',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
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
