import 'package:carrental/core/models/veihcle.dart';
import 'package:flutter/material.dart';

class CarRegisterd extends StatelessWidget {
  const CarRegisterd({super.key, required this.vehicle});
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.car_rental,
        size: 50,
      ),
      title: Text(vehicle.model!),
      subtitle: Column(
        children: [
          Text(vehicle.year!),
          Text(vehicle.priceToRent.toString()),
          Text(vehicle.currentCity!),
        ],
      ),
    );
  }
}
