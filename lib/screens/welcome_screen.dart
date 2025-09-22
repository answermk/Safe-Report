import 'package:flutter/material.dart';
import 'onboarding_screen_1.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top white section with illustration and phone mockup
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    // Curved background design
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color(0xFF5D80C1).withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Main illustration content
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Person illustration (simplified representation)
                            Container(
                              width: 80,
                              height: 120,
                              margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: [
                                  // Head
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFDBD1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  // Body
                                  Container(
                                    width: 40,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE5E5E5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  // Legs
                                  Container(
                                    width: 35,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2C3E50),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Phone mockup
                            Container(
                              width: 140,
                              height: 280,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black, width: 3),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Column(
                                  children: [
                                    // Notch
                                    Container(
                                      width: 50,
                                      height: 20,
                                      margin: EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    // Status indicators
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5D80C1),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    // Blue section
                                    Container(
                                      width: double.infinity,
                                      height: 60,
                                      margin: EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF5D80C1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Content lines
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE5E5E5),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            width: double.infinity,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE5E5E5),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF5D80C1),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 60,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE5E5E5),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom blue section with content
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5D80C1), Color(0xFF36599F)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App title
                      Text(
                        'SafeReport',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 30),
                      // Description
                      Text(
                        'A Real-Time Crime Prevention Platform uses smart technology to detect and respond to crime instantly, helping keep communities safe through quick alerts and data-driven actions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      // Get Started Button
                      Container(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OnboardingScreen1(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF36599F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
      ),
    );
  }
}