import 'package:carrental/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Car Rental',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
