class Employee {
  int employeeID;
  String address;
  String firstName;
  String lastName;
  String natID;

  Employee({
   required this.employeeID,
   required this.address,
  required  this.firstName,
   required this.lastName,
   required this.natID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Employee_ID': employeeID,
      'Address': address,
      'First_Name': firstName,
      'Last_Name': lastName,
      'Nat_ID': natID,
    };
  }
}