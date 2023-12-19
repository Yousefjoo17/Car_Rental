class Customer {
  int custId;
  String firstName;
  String lastName;
  String address;
  String drivingLicense;
  String natId;
  String email;
  String password;

  Customer({
    required this.custId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.drivingLicense,
    required this.natId,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'Cust_ID': custId,
      'First_Name': firstName,
      'Last_Name': lastName,
      'Address': address,
      'Driving_license': drivingLicense,
      'Nat_ID': natId,
      'email': email,
      'password':password
    };
  }
}
