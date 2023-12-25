class Employee {
  int? employeeID;
  String? firstName;
  String? lastName;
  String? natID;
  String? address;
  String? email;
  String? password;

  Employee({
    this.employeeID,
     this.firstName,
     this.lastName,
     this.natID,
     this.address,
     this.email,
     this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'First_Name': firstName,
      'Last_Name': lastName,
      'Nat_ID': natID,
      'Address': address,
      'email': email,
      'password': password,
    };
  }
}
