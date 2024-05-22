import 'package:flutter/material.dart';
import 'package:quiz_app/database/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;
  int? checkValue;

  //check function
  void check(int index) {
    int ansIndex = DataBase.myDB[i]['answer'];

    checkValue = index;
    setState(() {});
  }

  //next button
  void next() {
    setState(() {
      if (i < 3) {
        i++;
      }
    });
  }

  //prev button
  void prev() {
    setState(() {
      if (i > 0) {
        i--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      color: Colors.lightBlue[900],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
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
                              "Question ${i + 1}/20",
                              style: TextStyle(
                                  color: Colors.lightBlue[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30),
                            Text(
                              DataBase.myDB[i]['question'],
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.lightBlue[900],
                                  fontSize: 20,
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
                          backgroundColor: Colors.lightBlue[900],
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
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: DataBase.myDB.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => check(index),
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        color: checkValue == index
                            ? checkValue == DataBase.myDB[i]['answer']
                                ? Colors.green
                                : Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.lightBlue.shade900.withOpacity(0.9),
                          width: 5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          DataBase.myDB[i]['options'][index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
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
                      color: Colors.blue.shade900.withOpacity(.9),
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
                      color: Colors.blue.shade900.withOpacity(.9),
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
    );
  }
}
