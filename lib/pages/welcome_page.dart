import 'package:flutter/material.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/coffee_logo.jpg", scale: 2),
            ),

            const SizedBox(height: 43),

            Image.asset("assets/images/coffee_image.jpg", scale: 2),

            const Text(
              "Find your favorite",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),

            const Text(
              "Coffee Taste",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 4),

            const Text(
              "We're coffee shop, beer and wine bar,\n& event space for performing arts",
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xff55433C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(flex: 2),
                    Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Color(0xffA97C37),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
