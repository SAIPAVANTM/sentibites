import 'package:flutter/material.dart';
import '../HomePage/home.dart';
import 'package:sentibites/HomePage/home.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ),
                // Forgot Password text in the center, but moved a little down
                Positioned(
                  top: 73, // Move the text lower from the top
                  left: MediaQuery.of(context).size.width * 0.27, // Center horizontally
                  child: Text(
                    'Forgot Password',
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
              height: MediaQuery.of(context).size.height * 0.78, // Remaining part
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
                      'Don’t worry-we’ve got you covered! Enter your New password.',
                      style: TextStyle(
                        fontSize: 15, // Smaller size
                        fontWeight: FontWeight.normal, // Not bold
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30), // Space between text and fields

                    // Email label outside the input field
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // Email input field with customized decoration
                    TextField(
                      controller: emailController,
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
                    SizedBox(height: 16), // Space between input fields

                    // Old Password label outside the input field
                    Text(
                      'Old Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // Old Password input field with customized decoration
                    TextField(
                      controller: oldPasswordController,
                      obscureText: true,
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
                    SizedBox(height: 16), // Space between input fields

                    // New Password label outside the input field
                    Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // New Password input field with customized decoration
                    TextField(
                      controller: newPasswordController,
                      obscureText: true,
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
                    SizedBox(height: 16), // Space between input fields

                    // Confirm Password label outside the input field
                    Text(
                      'Confirm New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 8), // Space between label and input field

                    // Confirm Password input field with customized decoration
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
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
                    SizedBox(height: 24), // Space before submit button

                    // Centered Submit button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle password reset action here and navigate to HomePage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Center(child: Text('Submit')),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Button color (filled color)
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20), // Adjusted padding
                          minimumSize: Size(300, 50), // Set width and height for the button (adjusted)
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Rounded corners
                          ),
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjusted font size and weight
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
