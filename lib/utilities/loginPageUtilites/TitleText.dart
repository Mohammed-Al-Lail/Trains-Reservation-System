import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {

  const TitleText( this.text,{super.key});

  final String text ;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24 , top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350]
                      ),
                    ),
                ],
              ),
            );
  }
}