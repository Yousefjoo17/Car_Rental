

class CarOwner {
  String firstName;
  String lastName;
  int ownerId;
  String natId;
  String address;
  int paymentPerMonth;

  CarOwner({
    required this.firstName,
    required this.lastName,
    required this.ownerId,
    required this.natId,
    required this.address,
    required this.paymentPerMonth,
  });

  Map<String, dynamic> toMap() {
    return {
      'First_Name': firstName,
      'Last_Name': lastName,
      'Owner_ID': ownerId,
      'Nat_ID': natId,
      'Address': address,
      'Payment_per_month': paymentPerMonth,
    };
  }
}
