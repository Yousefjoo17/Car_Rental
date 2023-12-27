import 'package:carrental/constants.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/splash/presentation/views/loginView.dart';
import 'package:carrental/main.dart';
import 'package:flutter/material.dart';

class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
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
                iscustomer = true;
                isCarOwner = isAdmin = false;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              color: kprimaryColor2,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: "Admin",
              ontap: () {
                isAdmin = true;
                iscustomer = isCarOwner = false;

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
                isCarOwner = true;
                iscustomer = isAdmin = false;

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
