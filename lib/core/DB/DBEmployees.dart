import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/employee.dart';

class DBEmployee {
  static Future<void> insertEmployee(Employee employee) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Employee', employee.toMap());
  }

 static Future<List<Employee>> getAllEmployees() async {
    final dbClient = await SqlDb(). db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Employee');
    return List.generate(maps.length, (i) {
      return Employee(
        employeeID: maps[i]['Employee_ID'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        natID: maps[i]['Nat_ID'],
        address: maps[i]['Address'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

 static Future<void> printAllEmployeesInfo() async {
    final employees = await getAllEmployees();
    employees.forEach((employee) {
      print('Employee ID: ${employee.employeeID}');
      print('First Name: ${employee.firstName}');
      print('Last Name: ${employee.lastName}');
      print('Nat ID: ${employee.natID}');
      print('Address: ${employee.address}');
      print('Email: ${employee.email}');
      print('Password: ${employee.password}\n');
    });
  }
}