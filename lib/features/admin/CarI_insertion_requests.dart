import 'package:carrental/features/admin/widgets/CarInsertedItem.dart';
import 'package:flutter/material.dart';

class CarInsertionRequestsView extends StatelessWidget {
  const CarInsertionRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'inserted cars',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return const CarInsertedItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
