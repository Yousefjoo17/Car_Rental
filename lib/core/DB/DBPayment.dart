import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/payment.dart';

class DBPayment {
  // Insert a new payment
static  Future<int> insertPayment(Payment payment) async {
      final dbClient = await SqlDb().db;
    return await dbClient!.insert('Payment', payment.toMap());
  }
  

  // Get all payments
static  Future<List<Payment>> getPayments() async {
      final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Payment');
    return List.generate(maps.length, (i) {
      return Payment(
        downPayment: maps[i]['Down_payemnt'],
        paymentDate: maps[i]['payemnt_date'],
        payID: maps[i]['Pay_ID'],
        fullAmount: maps[i]['Full_amount'],
        damagePayment: maps[i]['Damage_payment'],
        custID: maps[i]['Cust_ID'],
        rentalID: maps[i]['Rental_ID'],
      );
    });
  }

  // Print all payments
 static Future<void> printAllPayments() async {
    final List<Payment> payments = await getPayments();

    if (payments.isEmpty) {
      print('No payments found.');
    } else {
      print('List of Payments:');
      for (final payment in payments) {
        print('Payment ID: ${payment.payID}');
        print('Down Payment: ${payment.downPayment}');
        print('Payment Date: ${payment.paymentDate}');
        print('Full Amount: ${payment.fullAmount}');
        print('Damage Payment: ${payment.damagePayment}');
        print('Customer ID: ${payment.custID}');
        print('Rental ID: ${payment.rentalID}');
        print('------------------------');
      }
    }
  }
}