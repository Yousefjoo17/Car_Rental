class Maintenance {
  String? startDate;
  String? endDate;
  int? cost;
  String? description;
  int? maintenanceID;
  int? carID;

  Maintenance({
     this.startDate,
     this.endDate,
     this.cost,
     this.description,
     this.maintenanceID,
     this.carID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Start_date': startDate,
      'End_Date': endDate,
      'Cost': cost,
      'Description': description,
      'Maintenace_ID': maintenanceID,
      'Car_ID': carID,
    };
  }
}
