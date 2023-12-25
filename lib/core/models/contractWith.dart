class Contract {
  int? ownerID;
  int? employeeID;

  Contract({
     this.ownerID,
     this.employeeID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Owner_ID': ownerID,
      'Employee_ID': employeeID,
    };
  }
}
