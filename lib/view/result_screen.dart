import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/view/welcome_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    double scoreValue = widget.score / 25;
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ));
            },
            icon: Icon(
              Icons.home,
              size: 40,
            )),
      ),
      body: Container(
        height: h1,
        width: w1,
        decoration: BoxDecoration(
            // color: Colors.blueGrey.shade100,
            // gradient: ColorConst.backgroundG,
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                //color: Colors.amber,
                child: Lottie.asset(
                  'assets/lotti_animation/result_screen_anime.json',
                  height: 500,
                  width: 500,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: CircularPercentIndicator(
                //  footer: Text("data"),
                animation: true,
                animationDuration: 3000,
                backgroundColor: Colors.grey.shade800,
                backgroundWidth: 19,
                circularStrokeCap: CircularStrokeCap.round,
                curve: Curves.bounceOut,
                radius: 130.0,
                lineWidth: 20.0,
                percent: scoreValue,
                center: Text(
                  widget.score.toString(),
                  style: GoogleFonts.aladin(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                /* footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "data",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ), */
                progressColor: Colors.green,
              ),
            ),
            Positioned(
              bottom: h1 / 5.5,
              child: Text(
                "${widget.score} out of 25 ",
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            /* / color: Colors.amber, */
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                },
                child: Container(
                  width: w1 / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "continue",
                      style: GoogleFonts.abyssinicaSil(
                        color: Colors.grey.shade900,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: 40,
                    color: Colors.grey.shade900,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
