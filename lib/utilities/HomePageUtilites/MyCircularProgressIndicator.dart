import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // the circular indicator
          Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
              )
              ),
          SizedBox(height: 5,),

          Text(
            "Loading the data ...",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          )    
      ],
    );
  }
}