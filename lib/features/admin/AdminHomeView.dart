import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/admin/addCarOwner.dart';
import 'package:carrental/features/admin/addCustomerView.dart';
import 'package:flutter/material.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor2, kprimaryColor1, kprimaryColor0]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Admin',
                  style: TextStyle(
                    fontFamily: 'Caveat',
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 130, child: Image.asset(AssetsData.car2)),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Insert Customer',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCustomerView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Insert Car Owner',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCarOwnerView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Car insertion requests',
                ontap: () {},
                color: kprimaryColor3,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
