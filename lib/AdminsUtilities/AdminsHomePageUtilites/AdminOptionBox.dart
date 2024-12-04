import 'package:flutter/material.dart';


class optionBox extends StatelessWidget {
  const optionBox({super.key,required this.title,required this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.only(top: 30 , bottom: 30),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.amber[100],
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Divider(
              color: Colors.amber[100],
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width* 0.3,
              endIndent: MediaQuery.of(context).size.width* 0.3,
              ),
          ],
        ),
      ),
    );
  }
}