import 'package:carrental/constants.dart';
import 'package:carrental/core/DB/DBRentalAgreement.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
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
                text: ' modals',
                ontap: () async {
                  final List<String> mostUsedModels =
                      await DBRentalAgreement.getTopFiveUsedCarModels();
                  final List<int> modelCounts =
                      await DBRentalAgreement.getTopFiveUsedCarModelCounts();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticsView(
                        names: mostUsedModels,
                        counts: modelCounts,
                        text: ' Modals',
                      ),
                    ),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: ' cities',
                ontap: () async {
                  final List<String> mostUsedModels =
                      await DBRentalAgreement.getTopFiveUsedCities();
                  final List<int> modelCounts =
                      await DBRentalAgreement.getTopFiveUsedCityCounts();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticsView(
                        names: mostUsedModels,
                        counts: modelCounts,
                        text: ' Cities',
                      ),
                    ),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: ' Seasons',
                ontap: () async {
                  final List<String> mostUsedModels =
                      await DBRentalAgreement.getTopFiveUsedMonths();
                  final List<int> modelCounts =
                      await DBRentalAgreement.getTopFiveUsedMonthCounts();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticsView(
                        names: mostUsedModels,
                        counts: modelCounts,
                        text: ' Seasons',
                      ),
                    ),
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
