import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/RentalAgreement.dart';

class DBRentalAgreement {
  static Future<int> addRentalAgreement(RentalAgreement agreement) async {
    final dbClient = await SqlDb().db;
    return dbClient!.insert('Rental_Agreement', agreement.toMap());
  }

  static Future<List<RentalAgreement>> getAllRentalAgreements() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps =
        await dbClient!.query('Rental_Agreement');
    return List.generate(maps.length, (i) {
      return RentalAgreement(
        rentalID: maps[i]['Rental_ID'],
        returnCity: maps[i]['Return_city'],
        pickUpCity: maps[i]['Pick_up_city'],
        pickUpDate: maps[i]['Pick_up_date'],
        returnDate: maps[i]['Return_date'],
        rentalAgreementDate: maps[i]['Rental_agreement_date'],
        review: maps[i]['Review'],
        payment: maps[i]['Payment'],
        custID: maps[i]['Cust_ID'],
        carID: maps[i]['Car_ID'],
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
        print('Payment: ${agreement.payment}');
        print('Customer ID: ${agreement.custID}');
        print('Car ID: ${agreement.carID}');
        print('------------------------');
      }
    }
  }

  static Future<List<String>> getTopFiveUsedCarModels() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT Model, COUNT(Model) as ModelCount
      FROM Rental_Agreement
      JOIN Vehicle ON Rental_Agreement.Car_ID = Vehicle.Car_ID
      GROUP BY Model
      ORDER BY ModelCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['Model'] as String;
    });
  }

  static Future<List<int>> getTopFiveUsedCarModelCounts() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT Model, COUNT(Model) as ModelCount
      FROM Rental_Agreement
      JOIN Vehicle ON Rental_Agreement.Car_ID = Vehicle.Car_ID
      GROUP BY Model
      ORDER BY ModelCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['ModelCount'] as int;
    });
  }

   static Future<List<String>> getTopFiveUsedCities() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT Return_city, COUNT(Return_city) as CityCount
      FROM Rental_Agreement
      GROUP BY Return_city
      ORDER BY CityCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['Return_city'] as String;
    });
  }

  static Future<List<int>> getTopFiveUsedCityCounts() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT Return_city, COUNT(Return_city) as CityCount
      FROM Rental_Agreement
      GROUP BY Return_city
      ORDER BY CityCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['CityCount'] as int;
    });
  }

  static Future<List<String>> getTopFiveUsedMonths() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT strftime('%Y-%m', Rental_agreement_date) as Month, COUNT(strftime('%Y-%m', Rental_agreement_date)) as MonthCount
      FROM Rental_Agreement
      GROUP BY Month
      ORDER BY MonthCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['Month'] as String;
    });
  }

  static Future<List<int>> getTopFiveUsedMonthCounts() async {
    final dbClient = await SqlDb().db;

    final List<Map<String, dynamic>> maps = await dbClient!.rawQuery('''
      SELECT strftime('%Y-%m', Rental_agreement_date) as Month, COUNT(strftime('%Y-%m', Rental_agreement_date)) as MonthCount
      FROM Rental_Agreement
      GROUP BY Month
      ORDER BY MonthCount DESC
      LIMIT 5
    ''');

    return List.generate(maps.length, (i) {
      return maps[i]['MonthCount'] as int;
    });
  }
}
