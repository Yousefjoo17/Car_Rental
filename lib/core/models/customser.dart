class Customer {
  int? custId; // Use nullable int, as it will be automatically generated
  String? firstName;
  String? lastName;
  String? address;
  String? drivingLicense;
  String? natId;
  String? email;
  String? password;

  Customer({
    this.custId,
     this.firstName,
     this.lastName,
     this.address,
     this.drivingLicense,
     this.natId,
     this.email,
     this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'First_Name': firstName,
      'Last_Name': lastName,
      'Address': address,
      'Driving_license': drivingLicense,
      'Nat_ID': natId,
      'Email': email,
      'password': password,
    };
  }
}
