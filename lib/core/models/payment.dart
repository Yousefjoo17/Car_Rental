class Payment {
  int? downPayment;
  String? paymentDate;
  int? payID;
  int? fullAmount;
  int? damagePayment;
  int? custID;
  int? rentalID;

  Payment({
     this.downPayment,
     this.paymentDate,
     this.payID,
     this.fullAmount,
     this.damagePayment,
     this.custID,
     this.rentalID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Down_payemnt': downPayment,
      'payemnt_date': paymentDate,
      'Pay_ID': payID,
      'Full_amount': fullAmount,
      'Damage_payment': damagePayment,
      'Cust_ID': custID,
      'Rental_ID': rentalID,
    };
  }
}
