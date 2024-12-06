import 'package:trains_reservation_app_ics321_project/classes/user.dart';

class Admin extends User{ 


Admin({
  required super.fName, 
  required super.lName,
  required super.email,
  required super.passowrd,
  String? age
});

  @override
  String objectType() {
    return "Admin".toLowerCase();
  }



}