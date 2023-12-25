import 'package:carrental/core/models/customser.dart';
import 'package:carrental/features/home/addCustomerView.dart';
import 'package:carrental/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

bool iScustomer = false;
bool iSEmployee = false;
bool isCarOwner=false;
Customer customer=Customer();
void main() {
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental',
      debugShowCheckedModeBanner: false,
      home:  AddCustomerView(customer: customer),
      theme: ThemeData(),
    );
  }
}
