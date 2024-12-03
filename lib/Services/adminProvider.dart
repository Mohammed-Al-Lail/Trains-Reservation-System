import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/admin.dart';

class AdminProvider extends ChangeNotifier{






  // data
  // Map of all users who have accounts on the app
  Map< String ,Admin > allPassengarsMap = {

   "admin1@gmail.com" :Admin(fName: "Ali", lName: "Al Salem", email: "admin1@gmail.com", passowrd: "54321"),
   "admin2@gmail.com" :Admin(fName: "Hussain", lName: "Al hussain", email: "admin2@gmail.com", passowrd: "54321")

  };
}