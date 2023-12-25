class CarOwnerPhoneEntry {
  int? phone;
  int? ownerID;

  CarOwnerPhoneEntry({
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