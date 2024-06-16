import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/view/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: 80,
        title: Text(
          "Flutter Quiz",
          style: GoogleFonts.dmSerifText(
            color: ColorConst.background,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ), */
      //backgroundColor: Colors.amber,
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /* Container(
            height: 400,
            width: double.infinity,
            //  color: Colors.black,
            child: Lottie.asset(
              'assets/lotti_animation/brain.json',
              height: 500,
              width: 500,
              fit: BoxFit.contain,
            ),
          ), */
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 50,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow.shade700,
                ),
                child: Center(
                  child: Text(
                    "start",
                    style: GoogleFonts.abyssinicaSil(
                      color: Colors.grey.shade900,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
