class Vehicle {
  int? carID;
  bool? availability;
  int? priceToRent;
  String? year;
  String? model;
  double? noKM;
  String? color;
  String? currentCity;
  String? registrationInformation;
  int? ownerID;

  Vehicle({
     this.carID,
     this.availability,
     this.priceToRent,
     this.year,
     this.model,
     this.noKM,
     this.color,
     this.currentCity,
     this.registrationInformation,
     this.ownerID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Car_ID': carID,
      'Availability': availability?? true, // Convert boolean to integer
      'price_to_rent': priceToRent,
      'Year': year,
      'Model': model,
      'No_KM': noKM?? 0,
      'Color': color,
      'Current_City': currentCity,
      'Registration_information': registrationInformation,
      'Owner_ID': ownerID?? 1,
    };
  }
}