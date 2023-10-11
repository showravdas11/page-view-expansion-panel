import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/foodone.png", width: 250, height: 250,),
          Text("Quality Food", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
        ],
      );
      // child: Text("Page1....."),
  }
}