import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/admin/CarI_insertion_requests.dart';
import 'package:carrental/features/admin/StatisticsView.dart';
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
              const SizedBox(height: 50),
              CustomButton(
                text: 'Car insertion requests',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarInsertionRequestsView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'required Brands',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RequiredBrandView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'most required Cities',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RequiredBrandView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Highest Season ',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RequiredBrandView()),
                  );
                },
                color: kprimaryColor3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
