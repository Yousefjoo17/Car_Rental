class CarOwnerPhone {
  String? phone;
  int? ownerID;

  CarOwnerPhone({
     this.phone,
     this.ownerID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Phone': phone,
      'Owner_ID': ownerID,
    };
  }
}
