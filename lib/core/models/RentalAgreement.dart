class RentalAgreement {
  int? rentalID;
  String? returnCity;
  String? pickUpCity;
  String? pickUpDate;
  String? returnDate;
  String? rentalAgreementDate;
  String? review;
  int? payment;
  int? custID;
  int? carID;

  RentalAgreement({
    this.rentalID,
    this.returnCity,
    this.pickUpCity,
    this.pickUpDate,
    this.returnDate,
    this.rentalAgreementDate,
    this.review,
    this.payment,
    this.custID,
    this.carID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Rental_ID': rentalID,
      'Return_city': returnCity,
      'Pick_up_city': pickUpCity,
      'Pick_up_date': pickUpDate,
      'Return_date': returnDate,
      'Rental_agreement_date': rentalAgreementDate,
      'Review': review,
      'Payment':payment,
      'Cust_ID': custID,
      'Car_ID': carID,
    };
  }
}
