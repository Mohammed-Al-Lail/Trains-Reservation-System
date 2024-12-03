import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/adminProvider.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/screens/LogInScreen/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider( // we will use multi providers in this project

       providers: [
        ChangeNotifierProvider(create: (context) => trainProvider(),), //1
        ChangeNotifierProvider(create: (context) => usersProvider(),), //2
        ChangeNotifierProvider(create: (context) => AdminProvider(),), //3
       ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SigninPage() 
      ),
    );
  }
}

