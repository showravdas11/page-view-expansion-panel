import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/foodtwo.png", width: 250, height: 250,),
          Text("Online Order", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
        ],
      );
  }
}