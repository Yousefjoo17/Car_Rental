import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:flutter/material.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor0, kprimaryColor1, kprimaryColor2]),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "Welcome!!",
              style: TextStyle(fontSize: 40),
            ))
          ],
        ),
      ),
    );
  }
}
