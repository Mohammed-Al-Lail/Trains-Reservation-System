import 'package:flutter/material.dart';

class personContainer extends StatelessWidget {
  const personContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 130,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        border: Border.all(
          color: Colors.grey.shade100,
          width: 6
        ),
      ),

      child:  Center(
        child: Icon(
          Icons.person,
          size: 110,
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}