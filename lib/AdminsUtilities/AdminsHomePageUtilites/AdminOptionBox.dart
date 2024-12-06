import 'package:flutter/material.dart';


class optionBox extends StatelessWidget {
  const optionBox({super.key,required this.numberOfOption,required this.title,required this.onTap});

  final int numberOfOption;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(255, 236, 179, 1),
              width: 3
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              "$numberOfOption- ",
              style: TextStyle(
                color: Colors.amber[100],
                fontSize: 26,
                fontWeight: FontWeight.w700
              ),
            ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.amber[100],
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}