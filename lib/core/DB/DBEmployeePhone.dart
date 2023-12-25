import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/EmployeePhone.dart';

class DBEmployeePhone {
  Future<void> insertEmployeePhone(EmployeePhone employeePhone) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Employee_Phone', employeePhone.toMap());
  }

  Future<List<EmployeePhone>> getAllEmployeePhones() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Employee_Phone');
    return List.generate(maps.length, (i) {
      return EmployeePhone(
        phone: maps[i]['Phone'],
        employeeID: maps[i]['Employee_ID'],
      );
    });
  }

  Future<void> printAllEmployeePhonesInfo() async {
    final employeePhones = await getAllEmployeePhones();
    employeePhones.forEach((employeePhone) {
      print('Phone: ${employeePhone.phone}');
      print('Employee ID: ${employeePhone.employeeID}\n');
    });
  }
}