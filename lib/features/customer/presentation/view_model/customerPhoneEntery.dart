class CustomerPhoneEntry {
  int? phone;
  int? custID;

  CustomerPhoneEntry({
    this.phone,
    this.custID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Phone': phone,
      'Cust_ID': custID,
    };
  }
}