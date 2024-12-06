abstract class User {

  User({
  required this.fName, 
  required this.lName,
  required this.email,
  required this.passowrd,
  this. age
});


  final String fName ;
  final String lName;
  final String email;
  final String passowrd;
  String? age;



   String objectType() ;
}