import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 400,
              width: double.infinity,
              color: Colors.amber[100],
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
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
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
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Colors.black,
                          width: 5,
                          style: BorderStyle.solid)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
