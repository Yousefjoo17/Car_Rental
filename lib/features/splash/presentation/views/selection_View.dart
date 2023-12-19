import 'package:carrental/constants.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/splash/presentation/views/loginView.dart';
import 'package:flutter/material.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  AssetsData.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              'Car rental',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontFamily: 'Caveat',
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: "Customer",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              color: kprimaryColor2,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: "Employee",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              color: kprimaryColor2,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: "Car Owner",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              color: kprimaryColor2,
            ),
          ],
        ),
      ),
    );
  }
}
