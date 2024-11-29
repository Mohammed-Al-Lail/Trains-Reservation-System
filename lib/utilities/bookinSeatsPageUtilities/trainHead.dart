import 'package:flutter/material.dart';

class trainHead extends StatelessWidget {
  const trainHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 200,
              height: 120,

              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(

                    width: 40, 
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    
                  ),

                  Container(

                    width: 40, 
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    
                  ),
                ],
              ),
            );
  }
}