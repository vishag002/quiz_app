// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/database/db.dart';
import 'package:quiz_app/utilis/audio_const.dart';
import 'package:quiz_app/utilis/color_const.dart';
import 'package:quiz_app/view/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //audio player

//
  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  int i = 0;
  int count = DataBase.myDB.length;
  int? checkValue;
  bool showAnswer = false;
  bool showLottie = false;
  int score = 0;

  //show ans after the time runs out
  void showAns(int index) {
    int ansIndex = DataBase.myDB[i]['answer'];
    if (index == ansIndex) {
      showAnswer = true;
    }

    checkValue = index;
    setState(() {});
  }

  //check function
  void check(int index) {
    int ansIndex = DataBase.myDB[i]['answer'];
    if (checkValue == null && index == ansIndex) {
      score++;
      playCorrectSound();
      showLottieAnimation();
    } else if (index != ansIndex && timerValue != 0) {
      playInCorrectSound();
    }
    /* else if (timerValue == 0) {
      playTimeOutSound();
    } */
    checkValue = index;
    setState(() {});
  }

  //lottie animation
  void showLottieAnimation() {
    setState(() {
      showLottie = true;
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        showLottie = false;
      });
    });
  }

  //next button
  void next() {
    setState(() {
      if (i <= count - 2) {
        i++;
        checkValue = null;
        startCountDown();
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                score: score,
              ),
            ));
      }
    });
    checkValue = null;
    showAnswer = false;
    setState(() {
      startCountDown();
      timerValue = 15;
    });
    //print(count);
  }

  //prev button
  void prev() {
    setState(() {
      if (i > 0) {
        i--;
      }
    });
  }

  //timer
  int timerValue = 15;
  Timer? countdownTimer;
  void startCountDown() {
    int ansIndex = DataBase.myDB[i]['answer'];
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (timerValue > 0) {
          timerValue--;
        } else {
          playTimeOutSound();
          timer.cancel();
          showAns(ansIndex);

          // showAnswer = true;
        }
      });
    });
  }

  //audio
  /* @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    //print('Loading image from: ${AssetImage('images/pic1.jpg').assetName}');
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: ColorConst.secondary,
      body: Container(
        height: h1,
        width: w1,
        decoration: BoxDecoration(
            // gradient: ColorConst.backgroundG,
            ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    //    color: Colors.amber[100],
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // gradient: ColorConst.backgroundG,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            /* image: DecorationImage(
                              image: AssetImage('assets/images/pic1.jpg'),
                              scale: 1,
                              fit: BoxFit.contain,
                            ), */
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 25,
                          child: Center(
                            child: Container(
                              height: 200,
                              width: 340,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlue.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.solid,
                                    offset: Offset(3, 3),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Question ${i + 1}/25",
                                    style: GoogleFonts.zcoolXiaoWei(
                                        color: ColorConst.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    DataBase.myDB[i]['question'],
                                    style: GoogleFonts.adventPro(
                                        // decoration: TextDecoration.underline,
                                        color: ColorConst.textColor,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: CircleAvatar(
                              radius: 45,
                              child: CircleAvatar(
                                radius: 40,
                                child: Text(
                                  timerValue.toString(),
                                  style: GoogleFonts.aBeeZee(
                                    color: ColorConst.textColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                backgroundColor: ColorConst.secondary,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            check(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 65,
                              width: 150,
                              decoration: BoxDecoration(
                                color: checkValue == index
                                    ? checkValue == DataBase.myDB[i]['answer']
                                        ? Colors.lightGreen
                                        : Colors.deepOrange.shade800
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    bottomRight: Radius.circular(70)),
                                /* border: Border.all(
                                color: Colors.lightBlue.shade900.withOpacity(0.9),
                                width: 5,
                                style: BorderStyle.solid,
                              ), */
                              ),
                              child: Center(
                                child: Text(
                                  DataBase.myDB[i]['options'][index],
                                  style: TextStyle(
                                    color: ColorConst.background,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: prev,
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.amber.shade900,
                          ),
                          child: Center(
                              child: Text(
                            "prev",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: next,
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.amber.shade900,
                          ),
                          child: Center(
                              child: Text(
                            "next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (showLottie)
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Lottie.asset(
                    'assets/lotti_animation/animation_1.json',
                    width: w1,
                    height: h1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
