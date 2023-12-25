class CarOwner {
  int? ownerID;
  String? firstName;
  String? lastName;
  String? natID;
  String? address;
  int? paymentPerMonth;
  String? email;
  String? password;

  CarOwner({
     this.ownerID,
     this.firstName,
     this.lastName,
     this.natID,
     this.address,
     this.paymentPerMonth,
     this.email,
     this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'First_Name': firstName,
      'Last_Name': lastName,
      'Nat_ID': natID,
      'Address': address,
      'Payment_per_month': paymentPerMonth,
      'email': email,
      'password': password,
    };
  }
}
