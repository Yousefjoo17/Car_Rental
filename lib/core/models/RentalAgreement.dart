class RentalAgreement {
  int? rentalID;
  String? returnCity;
  String? pickUpCity;
  String? pickUpDate;
  String? returnDate;
  String? rentalAgreementDate;
  String? review;
  int? custID;
  int? carID;
  int? employeeID;

  RentalAgreement({
    this.rentalID,
    this.returnCity,
    this.pickUpCity,
    this.pickUpDate,
    this.returnDate,
    this.rentalAgreementDate,
    this.review,
    this.custID,
    this.carID,
    this.employeeID,
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
      'Cust_ID': custID,
      'Car_ID': carID,
      'Employee_ID': employeeID,
    };
  }
}
