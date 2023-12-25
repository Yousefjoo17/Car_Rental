class ContractsEntry {
  int ownerID;
  int employeeID;

  ContractsEntry({
   required this.ownerID,
   required this.employeeID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Owner_ID': ownerID,
      'Employee_ID': employeeID,
    };
  }
}
