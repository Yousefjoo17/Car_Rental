import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/RentalAgreement.dart';

class DBRentalAgreement {
 static Future<int> addRentalAgreement(RentalAgreement agreement) async {
      final dbClient = await SqlDb().db;
    return dbClient!.insert('Rental_Agreement', agreement.toMap());
  }

  static Future<List<RentalAgreement>> getAllRentalAgreements() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Rental_Agreement');
    return List.generate(maps.length, (i) {
      return RentalAgreement(
        rentalID: maps[i]['Rental_ID'],
        returnCity: maps[i]['Return_city'],
        pickUpCity: maps[i]['Pick_up_city'],
        pickUpDate: maps[i]['Pick_up_date'],
        returnDate: maps[i]['Return_date'],
        rentalAgreementDate: maps[i]['Rental_agreement_date'],
        review: maps[i]['Review'],
        custID: maps[i]['Cust_ID'],
        carID: maps[i]['Car_ID'],
        employeeID: maps[i]['Employee_ID'],
      );
    });
  }

 static Future<void> printAllRentalAgreements() async {
    final List<RentalAgreement> agreements = await getAllRentalAgreements();

    if (agreements.isEmpty) {
      print('No rental agreements found.');
    } else {
      print('List of Rental Agreements:');
      for (final agreement in agreements) {
        print('Rental ID: ${agreement.rentalID}');
        print('Return City: ${agreement.returnCity}');
        print('Pick-up City: ${agreement.pickUpCity}');
        print('Pick-up Date: ${agreement.pickUpDate}');
        print('Return Date: ${agreement.returnDate}');
        print('Rental Agreement Date: ${agreement.rentalAgreementDate}');
        print('Review: ${agreement.review}');
        print('Customer ID: ${agreement.custID}');
        print('Car ID: ${agreement.carID}');
        print('Employee ID: ${agreement.employeeID}');
        print('------------------------');
      }
    }
  }
}