import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/customser.dart';
import 'package:carrental/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

bool iscustomer = false;
bool isAdmin = false;
bool isCarOwner = false;
late SqlDb sqlDb;

Customer customer = Customer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  sqlDb = SqlDb();
  await sqlDb.db;

  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      theme: ThemeData(),
    );
  }
}
