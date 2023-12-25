class EmployeePhone {
  String? phone;
  int? employeeID;

  EmployeePhone({
     this.phone,
     this.employeeID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Phone': phone,
      'Employee_ID': employeeID,
    };
  }
}
