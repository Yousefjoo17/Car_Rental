import 'package:flutter/material.dart';

class CarRegisterd extends StatelessWidget {
  const CarRegisterd({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(
        Icons.car_rental,
        size: 50,
      ),
      title: Text("BMW"),
      subtitle: Column(
        children: [
          Text('Year'),
          Text('Model'),
          Text('No km'),
          Text('Current_City'),
        ],
      ),
    );
  }
}
