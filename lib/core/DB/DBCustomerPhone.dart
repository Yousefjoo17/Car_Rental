import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/customerPhoneEntery.dart';

class DBCustomerPhone {
   Future<void> insertCustomerPhone(CustomerPhone customerPhone) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Customer_phone', customerPhone.toMap());
  }

  Future<List<CustomerPhone>> getAllCustomerPhones() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Customer_phone');
    return List.generate(maps.length, (i) {
      return CustomerPhone(
        phone: maps[i]['Phone'],
        custID: maps[i]['Cust_ID'],
      );
    });
  }

  Future<void> printAllCustomerPhonesInfo() async {
    final customerPhones = await getAllCustomerPhones();
    customerPhones.forEach((customerPhone) {
      print('Phone: ${customerPhone.phone}');
      print('Customer ID: ${customerPhone.custID}\n');
    });
  }
}
