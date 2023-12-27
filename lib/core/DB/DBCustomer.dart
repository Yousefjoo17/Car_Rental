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

  static Future<bool> isCustomerFoundByEmailAndPassword(
      String email, String password) async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Customer',
      where: 'Email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return maps.isNotEmpty;
  }

  static Future<bool> isEmailFound(String email) async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Customer',
      where: 'Email = ?',
      whereArgs: [email],
    );
    return maps.isNotEmpty;
  }

  static Future<bool> isNatIdFound(String natId) async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Customer',
      where: 'Nat_ID = ?',
      whereArgs: [natId],
    );
    return maps.isNotEmpty;
  }


  static Future<Customer?> getCustomerByEmail(String email) async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Customer',
      where: 'Email = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return Customer(
        custId: maps[0]['Cust_ID'],
        firstName: maps[0]['First_Name'],
        lastName: maps[0]['Last_Name'],
        address: maps[0]['Address'],
        drivingLicense: maps[0]['Driving_license'],
        natId: maps[0]['Nat_ID'],
        email: maps[0]['Email'],
        password: maps[0]['password'],
      );
    } else {
      return null; // Customer not found
    }
  }
}
