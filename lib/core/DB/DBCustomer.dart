 import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/customser.dart';

class DBCustomer {

   static Future<void> insertCustomer(Customer customer) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Customer', customer.toMap());
  }

  static Future<List<Customer>> getAllCustomers() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Customer');
    return List.generate(maps.length, (i) {
      return Customer(
        custId: maps[i]['Cust_ID'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        address: maps[i]['Address'],
        drivingLicense: maps[i]['Driving_license'],
        natId: maps[i]['Nat_ID'],
        email: maps[i]['Email'],
        password: maps[i]['password'],
      );
    });
  }

 static Future<void> printAllCustomersInfo() async {
    final customers = await getAllCustomers();
    customers.forEach((customer) {
      print('Customer ID: ${customer.custId}');
      print('First Name: ${customer.firstName}');
      print('Last Name: ${customer.lastName}');
      print('Address: ${customer.address}');
      print('Driving License: ${customer.drivingLicense}');
      print('Nat_ID: ${customer.natId}');
      print('Email: ${customer.email}');
      print('Password: ${customer.password}\n');
    });
  }
}
